#!/bin/sh

set -e
set -u

DIR="$(dirname $0)"

dc() {
	docker-compose -p template_python_django -f ${DIR}/docker-compose.yml $*
}

trap 'dc kill ; dc rm -f' EXIT

rm -rf ${DIR}/backups
mkdir -p ${DIR}/backups

echo "Building dockers"
dc down
dc pull
dc build

dc up -d database
dc up -d elasticsearch
dc run importer /.jenkins/docker-wait.sh

dc exec -T database update-table.sh bag bag_pand public template_python_django
dc exec -T database update-table.sh bag bag_nummeraanduiding public template_python_django

dc run --rm importer

echo "Running backups"
dc exec -T database backup-db.sh template_python_django
dc exec -T elasticsearch backup-indices.sh template_python_django template_python_django

echo "Done"

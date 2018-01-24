# Template Python Django

Template project for a Python-Django project

## Development

* Python 3.6
* [Docker-Compose](https://docs.docker.com/compose/)

### Local dockers and local server

    # start the local docker containers
    docker-compose up -d database --build
    docker-compose up -d elasticsearch --build
    
    # create virtual environment
    python3 -m venv venv
    source venv/bin/activate

    # Change to source directory
    cd src
    
    # install the requirements in the virtual env
    pip install -r requirements.txt

    # migrate database to most recent version
    ./manage.py migrate

    # start server
    ./manage.py runserver

    # check out status at:
    http://localhost:8000/status/health
    http://localhost:8000/status/data
    http://localhost:8000/template_python_django/hello

### Test
    
    cd src
    
    # code style
    flake8 --config=.jenkins/test/flake.cfg template_python_django
    
    # unit tests
    ./manage.py test

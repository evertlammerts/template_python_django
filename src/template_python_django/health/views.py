import logging

from django.http import HttpResponse

log = logging.getLogger(__name__)


def health(request):
    log.debug('health')
    # check database access

    # check elastic search access

    return HttpResponse("Connectivity OK", content_type='text/plain', status=200)


def check_data(request):
    log.debug('data')
    # check database data

    # check elastic search data

    return HttpResponse("Data OK", content_type='text/plain', status=200)

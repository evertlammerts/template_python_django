# Create your views here.

import logging
from django.http import HttpResponse

log = logging.getLogger(__name__)


def hello(request):
    log.debug('hello')
    return HttpResponse("Hello", content_type='text/plain', status=200)

#!/bin/sh

set -e

python manage.py migrate --noinput
python manage.py collectstatic --noinput
python manage.py makemigrations --noinput
gunicorn --bind 0.0.0.0:8000 --log-level=DEBUG app.wsgi
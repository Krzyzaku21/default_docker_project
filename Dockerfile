# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.9-alpine3.13
# LABEL maintainer="krzyzak21.pl"

EXPOSE 8000

ENV PATH="/scripts:${PATH}"
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install psycopg2
RUN pip install --upgrade pip
RUN python -m pip install -r requirements.txt
RUN apk del .tmp

COPY /app /app
WORKDIR /app

COPY ./scripts /scripts
RUN chmod +x /scripts/*

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# File wsgi.py was not found in subfolder: 'default_docker_project'. Please enter the Python path to wsgi file.
ENTRYPOINT [ "/scripts/entrypoint.sh" ]
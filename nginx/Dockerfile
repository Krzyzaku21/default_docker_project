FROM nginxinc/nginx-unprivileged:1-alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uwsgi_params

USER root

RUN mkdir -p ./nginx/default_docker_project/app/staticfiles
RUN chmod -R 755 ./nginx/default_docker_project/app/staticfiles

RUN mkdir -p ./nginx/default_docker_project/app/media
RUN chmod -R 755 ./nginx/default_docker_project/app/media

USER nginx

## Project name:
default_docker_project
## Technologies:
django
docker
nginx
gunicorn
logging
-local
-web
debugg_in_vscode
-local
##Containers:
default_docker_project
ports 
-8000
-8100
## Images:
- default_docker_project_app
- default_docker_project_nginx
- debugging_default_docker_project_app
- python

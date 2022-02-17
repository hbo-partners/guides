DOCKER_COMPOSE  = docker-compose
EXEC_PHP        = $(DOCKER_COMPOSE) exec mkdocs

up:
	$(DOCKER_COMPOSE) up -d
	$(MAKE) plugins

plugins:
	$(EXEC_PHP) pip install mkdocs-render-swagger-plugin 
	$(EXEC_PHP) pip install mkdocs-awesome-pages-plugin 

restart:
	$(DOCKER_COMPOSE) restart

down:
	$(DOCKER_COMPOSE) down --volumes

destroy:
	$(DOCKER_COMPOSE) down --volumes --rmi local

log:
	$(DOCKER_COMPOSE) logs --follow

bash:
	$(EXEC_PHP) sh

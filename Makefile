GOCMD=go
GOBUILD=$(GOCMD) build
GORUN=$(GOCMD) run
GOTEST=$(GOCMD) test
BINARY_NAME=mybinary
BINARY_UNIX=$(BINARY_NAME)_unix
DOCKER-COMPOSE=docker-compose
DOCKER=docker
CONTAINER_NAME=makefile_db

all: test build
build:
	$(GOBUILD) -o $(BINARY_NAME) -v
run:
	$(GORUN) main.go
test:
	$(GORTEST) -v ./...
db:
	$(DOCKER-COMPOSE) up -d
db/rm:
	$(DOCKER) stop $(CONTAINER_NAME)
	$(DOCKER) rm $(CONTAINER_NAME)
mysql:
	$(DOCKER) exec -it $(CONTAINER_NAME) mysql -u root -p
	
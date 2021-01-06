

IMAGENAME=hello-world
REPO=ppal002
IMAGEFULLNAME=${REPO}/${IMAGENAME}

.DEFAULT_GOAL := all

build:
	    @docker build -t ${IMAGEFULLNAME} .

run:
	@docker run -p 3000:3000 -d ${IMAGEFULLNAME}

dev: 
	@docker-compose up
clean:
	@docker stop ${shell eval docker ps | awk 'NR > 1 {print $1}'}

all: build run

TEMPLATE_NAME ?= janus

run: image
	docker run -ti -p 0.0.0.0:7889:7889 -p 0.0.0.0:8089:8089 -t $(TEMPLATE_NAME)

daemon: image
	docker run -d -p 0.0.0.0:7889:7889 -p 0.0.0.0:8089:8089 -t $(TEMPLATE_NAME)

shell: image
	docker run -p 0.0.0.0:7889:7889 -p 0.0.0.0:8089:8089 -a stdin -a stdout -i -t $(TEMPLATE_NAME) /bin/bash

image:
	docker build -t $(TEMPLATE_NAME) .

stop:
	docker ps | grep janus | cut -f1 -d' ' | xargs docker stop

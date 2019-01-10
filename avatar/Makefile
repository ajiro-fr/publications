BUILD_CMD=ruby deck.rb

build:
	${BUILD_CMD}

docker-build:
	docker run --rm -it -v $(shell pwd):/data -w /data registry.gitlab.com/azae/squib:0.13.1 make

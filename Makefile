branch_name:=$(shell git branch | grep \* | cut -d' ' -f 2)
image_name:=earthquakesan/ckan-datapusher:${branch_name}
build:
	docker build -t ${image_name} .

test:
	docker run -p 80:8800 -it --rm ${image_name}

push:
	docker push ${image_name}

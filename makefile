docker-linux-test:
	@echo ">> running docker image"
	docker run --rm -i -t \
	-v ${PWD}:/mnt/workspace/site \
	-w /mnt/workspace/site \
	-p 8080:8080 \
	-p 1313:1313 \
	ubuntu bash;

# tar --dereference --hard-dereference --directory ${PWD}/public -cvf "${PWD}/site.tar" --exclude=.git --exclude=.github .

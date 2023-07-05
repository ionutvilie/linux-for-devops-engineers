# tar --dereference --hard-dereference --directory ${PWD}/public -cvf "${PWD}/site.tar" --exclude=.git --exclude=.github .
docker-linux-test:
	@echo ">> running docker image"
	docker run --rm -i -t \
	-v ${PWD}:/mnt/workspace/site \
	-w /mnt/workspace/site \
	-p 8080:8080 \
	-p 1313:1313 \
	ubuntu bash;

hugo-build:
	hugo \
	--gc \
	--minify \
	--baseURL "http://localhost:8080/linux-for-devops-engineers/" \

hugo-clean:
	rm -rf public/

hugo-server:
	go run main.go

hugo-build: hugo-build hugo-server

hugo-rebuild: hugo-clean hugo-build hugo-server

VERSION := 0.0.15

build:
	docker build -t dasmeta/mongodb-query-logs:$(VERSION) ./docker

publish:
	docker push dasmeta/mongodb-query-logs:$(VERSION)

helm-install:
	cd helm/mongodb-query-logs && helm upgrade --install mongodb-query-logs .

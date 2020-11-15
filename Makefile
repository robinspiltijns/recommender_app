run-backend:
	docker build -t recommender-backend ./backend
	docker run -p 8080:8080 recommender-backend

generate-backend:
	swagger-codegen generate -i api-spec.yaml -l go-server -o backend

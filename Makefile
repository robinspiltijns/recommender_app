run-backend:
	docker build -t recommender-backend ./backend
	docker run -p 8080:8080 recommender-backend

generate-backend:
	swagger-codegen generate -i api-spec.yaml -l go-server -o backend

generate-frontend:
	swagger-codegen generate -i api-spec.yaml -l dart -o frontend/swagger
	perl -i -pe's/BrowserClient/IOClient/g' frontend/swagger/lib/api_client.dart
	perl -i -pe's/browser_client/io_client/g' frontend/swagger/lib/api.dart
	echo 'environment:\n  sdk: ">=2.7.0 <3.0.0"' >> frontend/swagger/pubspec.yaml
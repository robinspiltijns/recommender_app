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
	cd frontend/swagger; flutter pub get

deploy:
	docker-compose -f backend/docker-compose.yaml build
	docker-compose -f backend/docker-compose.yaml down -v
	docker-compose -f backend/docker-compose.yaml up -d --force-recreate

save-image:
	docker-compose -f backend/docker-compose.yaml build
	docker save -o ./docker-image.tar backend_podcast_recommender:latest

copy-to-server:
	ssh -L 10022:picasso.experiments.cs.kuleuven.be:2222 $(rNumber)@st.cs.kuleuven.be
	scp -P 10022 docker-image.tar student@127.0.0.1:~/group12/

deploy-on-server:
	# get id of current container
	podman ps

	# stop current container
	podman stop <container_id>

	# load new container
	podman load --input group12/docker-image.tar

	# start newly loaded container
	#  	forward external port 3955 to internal port 8080
	podman run -d -p 3955:8080 localhost/backend_podcast_recommender:latest

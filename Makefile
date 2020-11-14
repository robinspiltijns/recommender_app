run-backend:
	docker build -t recommender-backend ./backend
	docker run -p 8080:8080 swagger_server
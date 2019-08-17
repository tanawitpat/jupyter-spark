start: 
	docker-compose up -d --build --force-recreate

log:
	docker logs jupyter-spark
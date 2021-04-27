cb-get-repos:
	mkdir cb-repos
	git clone https://github.com/walmartdigital/products-db.git cb-repos/database
	git clone https://github.com/carlos-benner/walmartchile-interview-exercise-nodejs-api.git cb-repos/api
	git clone https://github.com/carlos-benner/walmartchile-interview-exercise-front.git cb-repos/frontend

cb-build-containers:
	cp Dockerfile.db cb-repos/database/Dockerfile
	docker-compose up -d
	docker-compose exec cb-mongodb bash -c '/home/database/import.sh localhost /home'
	sleep 10
	docker-compose exec cb-api sh -c 'cd /usr/src/app && npm test'

cb-set-containers:
	make cb-remove-repos
	make cb-get-repos
	make cb-build-containers

cb-remove-repos:
	rm -rf cb-repos

cb-stop-containers:
	docker stop cb-mongodb
	docker stop cb-api
	docker stop cb-frontend

cb-remove-containers: 
	docker rm cb-mongodb
	docker rm cb-api
	docker rm cb-frontend

cb-remove-images: 
	docker rmi $$(docker images -f reference=dockercompose_cb-frontend -q)
	docker rmi $$(docker images -f reference=dockercompose_cb-api -q)
	docker rmi $$(docker images -f reference=dockercompose_cb-mongodb -q)

cb-clear-images:
	make cb-remove-repos -i 
	make cb-stop-containers -i 
	make cb-remove-containers -i 
	make cb-remove-images -i 



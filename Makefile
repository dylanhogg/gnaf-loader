.PHONY: compose-up
compose-up:
	# Bring everything up.
	# First time you need to run `exec-loader` to populate the database.
	docker-compose up -d

.PHONY: compose-down
compose-down:
    # Take everything down.
	docker-compose down

.PHONY: logs
logs:
    # All logs
	docker-compose logs -f

.PHONY: logs-db
logs-db:
    # Database logs
	docker-compose logs -f -t db

.PHONY: logs-loader
logs-loader:
    # Loader logs
	docker-compose logs -f -t loader

.PHONY: exec-loader
exec-loader: compose-up
    # Execute script loading psql database from GNAF files in data folder.
    # NOTE: Can take ~3.5 hrs depending on hardware etc.
	docker exec -it gnaf-loader_loader_1 /app/load-gnaf.sh

.PHONY: db-login
db-login:
    # Run a psql terminal
	docker exec -it gnaf-loader_db_1 sh -c 'exec psql -U gnaf'

.PHONY: db-ip
db-ip:
    # Get ip of loader
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' gnaf-loader_db_1

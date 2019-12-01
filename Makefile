.PHONY: compose-up
compose-up:
	docker-compose up -d

.PHONY: logs
logs:
	docker-compose logs -f

.PHONY: logs-db
logs-db:
	docker-compose logs -f -t db

.PHONY: logs-loader
logs-loader:
	docker-compose logs -f -t loader
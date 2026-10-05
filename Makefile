init:
	docker exec -i dwh psql -U admin -d dwh < schema/staging.sql
	docker exec -i dwh psql -U admin -d dwh < schema/dwh.sql
	docker exec -i dwh psql -U admin -d dwh < schema/marts.sql

etl:
	bash scripts/run_etl.sh

test:
	docker exec -i dwh psql -U admin -d dwh < tests/test_not_null.sql

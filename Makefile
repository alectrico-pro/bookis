test: 
	docker compose up test

build:
	docker compose build web

new:
	docker compose run new

run:
	docker compose run web

dev:
	docker compose run rspec /bin/sh -c "bundle exec  hanami dev"

server:
	docker compose run web /bin/sh -c "bundle exec hanami server"

web:
	docker compose run web

console:
	docker compose run web /bin/sh -c "bundle exec hanami console"

compile:
	docker compose run rspec /bin/sh -c "bundle exec hanami assets compile"

cli:
	docker compose run web /bin/sh -c "bundle exec hanami --help"

b:
	docker compose run web /bin/sh -c "bundle exec hanami dev"

routes:
	docker compose run web /bin/sh -c "bundle exec hanami routes"

middle:
	docker compose run web /bin/sh -c "bundle exec hanami middleware"

rspec:
	docker compose run rspec /bin/sh -c "bundle exec rspec spec/requests/books/index_spec.rb"


watch:
	docker compose run rspec /bin/sh -c "bundle exec hanami assets watch"

unfrozen:
	docker compose run rspec /bin/sh -c "bundle config unset frozen"

host:
	docker network inspect bookshelf_rspec

#requiere docker compose run db
create_db:
	docker compose exec db psql -U postgres
	CREATE DATABASE bookshelf_api_development;


create_db_test:
	docker compose exec db_test psql -U postgres
	CREATE DATABASE bookshelf_api_test;


image:
	docker build -t simple-api -f Dockerfile .


migration:
	docker compose run web bash -c "bundle exec rake db:create_migration[create_books]"


migrate:
	docker compose run web bash -c "bundle exec rake db:migrate"

migrate_test:
	docker compose run web bash -c "HANAMI_ENV=test bundle exec rake db:migrate"




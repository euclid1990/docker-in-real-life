#!/bin/bash

APP_PATH="./app"

(cd $APP_PATH && docker-compose exec redis redis-cli keys "*")

(cd $APP_PATH && docker-compose exec redis redis-cli get "hits")

(cd $APP_PATH && docker-compose exec redis redis-cli monitor)


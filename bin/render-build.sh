#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
yarn build
# bundle exec rails db:migrate
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset
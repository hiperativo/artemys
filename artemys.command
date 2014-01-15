#! /bin/sh
cd "$(dirname "$0")"
export $(heroku config --shell) EMAIL_RECEIVER=pedrozath@gmail.com
unset DATABASE_URL
bundle install
rake db:migrate
foreman start
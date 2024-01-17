#!/bin/bash
export PATH=/usr/share/rvm/gems/ruby-2.7.2/bin:/usr/share/rvm/gems/ruby-2.7.2@global/bin:/usr/share/rvm/rubies/ruby-2.7.2/bin:/usr/share/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

set -e

APP_PATH=/var/www/html/solidus-modified-theme_auto

if [ ! -f "$APP_PATH/db/schema.rb" ]; then
  # Perform Solidus installation and setup
  cd "$APP_PATH"
  bin/rails g solidus:install 
  rake db:create
  rake db:migrate
  rake db:seed
else
  # Perform any necessary updates
  cd "$APP_PATH"
  bundle install
  rake db:migrate
fi
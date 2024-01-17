#!/bin/bash
export PATH=/usr/share/rvm/gems/ruby-2.7.2/bin:/usr/share/rvm/gems/ruby-2.7.2@global/bin:/usr/share/rvm/rubies/ruby-2.7.2/bin:/usr/share/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
cd /var/www/html/solidus-modified-theme_auto/
#sudo apt-get install ruby2.3-dev libffi-dev -y
gem install nokogiri — — use-system-libraries
bundle config build.nokogiri — use-system-libraries
gem install bundler — user-install
bundle install
rake db:create
rake db:migrate
bin/rails g solidus:install -f
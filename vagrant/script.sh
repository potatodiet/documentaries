#!/bin/sh

sudo -u postgres createuser vagrant --createdb

cd /home/vagrant/code/documentaries
bundle install
rake db:create db:migrate

#!/bin/sh

apt-get update
apt-get upgrade

apt-get install postgresql postgresql-contrib libpq-dev -y # Needed for postgresql
apt-get install nfs-common portmap -y # Needed for nfs
apt-get install nodejs -y # Needed for asset pipeline
apt-get install ruby-dev -y # Needed for rails
apt-get install build-essential g++ -y # Needed for native extensions

gem install bundler

sudo -u postgres createuser vagrant --createdb

cd /home/vagrant/code/documentaries
sudo -u vagrant bundle install
sudo -u vagrant rake db:create db:migrate

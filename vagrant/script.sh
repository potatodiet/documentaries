#!/bin/sh

apt-get update
apt-get upgrade

apt-get install postgresql postgresql-contrib libpq-dev -y # Needed for postgresql
apt-get install nfs-common portmap -y # Needed for nfs
apt-get install nodejs -y # Needed for asset pipeline
apt-get install build-essential g++ -y # Needed for native extensions
apt-get install git -y

# Install rbenv to manage ruby version
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

# Install ruby-build as a rbenv plugin
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install 2.1.2

gem install bundler

sudo -u postgres createuser vagrant --createdb

cd /home/vagrant/code/documentaries
sudo -u vagrant bundle install
sudo -u vagrant rake db:create db:migrate

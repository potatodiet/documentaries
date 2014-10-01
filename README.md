Documentaries
----------
Video sharing website with a focus on documentaries.

Production Requirements
----------
* PostgreSQL (MySQL or SQLite should also work)
* Ruby (2.1.2)
* Node.js (Linux only)

Development Requirements
----------
* Vagrant
* VirtualBox (Windows, Mac)
* LXC (Linux)

Development Setup
----------
```
# MySQL, and SQLite also available
cp config/database.postgresql.yml config/database.yml

cd vagrant/

# Windows or Mac
cp Vagrantfile.virtual_box Vagrantfile
# Linux
cp Vagrantfile.lxc Vagrantfile

vagrant up
vagrant ssh

cd code/documentaries/

bundle install
rbenv rehash

rake db:setup

rails server
```

View in browser at "http://localhost:3000"

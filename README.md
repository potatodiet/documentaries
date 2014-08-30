Documentaries
----------
Video sharing website with a focus on documentaries.

Production Requirements
----------
* PostgreSQL
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
cd vagrant/

# Windows or Mac
cp Vagrantfile.virtual_box Vagrantfile
# Linux
cp Vagrantfile.lxc Vagrantfile

vagrant up
vagrant ssh

cd /home/vagrant/code/documentaries/
rails server
```

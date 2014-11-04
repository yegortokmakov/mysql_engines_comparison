# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "mysql" do |mysql|

    mysql.vm.box = "chef/debian-7.6"

    mysql.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      # vb.customize ["modifyvm", :id, "--cpus", 2]
    end

    mysql.vm.provision "shell", path: "provision/setup_mysql.sh"

  end

  config.vm.define "percona" do |percona|

    percona.vm.box = "chef/debian-7.6"

    percona.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      # vb.customize ["modifyvm", :id, "--cpus", 2]
    end

    percona.vm.provision "shell", path: "provision/setup_percona.sh"

  end

  config.vm.define "mongo" do |mongo|

    mongo.vm.box = "chef/debian-7.6"

    mongo.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpus", 2]
    end

    mongo.vm.provision "shell", path: "provision/setup_mongo.sh"

  end

end

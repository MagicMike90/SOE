# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
host_vagrantfile = "./host/Vagrantfile"
force_host_vm = TRUE
ENV['VAGRANT_DEFAULT_PROVIDER'] = "docker"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.define "mysql" do |db|
    
    db.vm.provider "docker" do |d|
      d.image="mysql"
      # d.build_dir = "./docker/mysql"
      d.name = "mysql"
      d.vagrant_machine = "host"
			d.vagrant_vagrantfile = host_vagrantfile
			d.force_host_vm = force_host_vm

      d.env = {
        :MYSQL_ROOT_PASSWORD => "root",
        :MYSQL_DATABASE      => "dockertest",
        :MYSQL_USER          => "dockertest",
        :MYSQL_PASSWORD      => "d0cker"
      }
      d.ports =["3306:3360"]
      d.remains_running = true
    end
    db.vm.hostname = "mysql"
  end

  config.vm.define "dev", primary: true do |dev|
	
		dev.vm.provider "docker" do |d|
			# d.image = "phusion/baseimage"
      d.name = "dev"
      d.build_dir = "./docker/ubuntu"

			d.vagrant_machine = "host"
			d.vagrant_vagrantfile = host_vagrantfile
			d.force_host_vm = force_host_vm
      #use for testing
      # d.cmd = ["ping", "-c 51", "127.0.0.1"]

      d.link("mysql:mysql")

			d.has_ssh = true
      # d.remains_running = true
		end
		
		# dev.vm.synced_folder ".", "/root/book"
    		
		dev.vm.network "forwarded_port", guest: 6800, host: 6800
		dev.vm.network "forwarded_port", guest: 2222, host: 2222
		dev.vm.hostname = "dev"
	end

  config.ssh.username = 'root'
  config.ssh.private_key_path = 'insecure_key'
end

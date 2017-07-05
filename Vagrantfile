# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
host_vagrantfile = "./host/Vagrantfile"
force_host_vm = TRUE
ENV['VAGRANT_DEFAULT_PROVIDER'] = "docker"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # -------------- MongoDB --------------
  config.vm.define "mongodb" do |mongo|
    
    mongo.vm.provider "docker" do |d|
      d.image="mongo"
      d.vagrant_machine = "host"
      d.vagrant_vagrantfile = host_vagrantfile
      d.force_host_vm = force_host_vm

      # d.build_dir = "./docker/mongo"
      # d.env = {
      #   :MONGO_DATA_DIR      => "/data/db",
      #   :MONGO_LOG_DIR       => "/dev/null",
      # }
      d.volumes = ["/var/mongo/data:/data/db"]
      d.name = "mongodb"
      # d.ports =["27018:27017"]
      d.remains_running = true
    end

    mongo.vm.hostname = "mongodb"
    mongo.vm.network "forwarded_port", guest: 27017, host: 27018
    # mongo.vm.synced_folder "../mern/data/db", "/data/db"
  end
  
  # config.vm.define "mysql" do |db|
    
  #   db.vm.provider "docker" do |d|
  #     d.image="mysql"
  #     # d.build_dir = "./docker/mysql"
  #     d.name = "mysql"
  #     d.vagrant_machine = "host"
	# 		d.vagrant_vagrantfile = host_vagrantfile
	# 		d.force_host_vm = force_host_vm

  #     d.env = {
  #       :MYSQL_ROOT_PASSWORD => "root",
  #       :MYSQL_DATABASE      => "dockertest",
  #       :MYSQL_USER          => "dockertest",
  #       :MYSQL_PASSWORD      => "d0cker"
  #     }
  #     d.ports =["3306:3360"]
  #     d.remains_running = true
  #   end
  #   db.vm.hostname = "mysql"
  # end


  # -------------- Node --------------
  config.vm.define "mern" do |mern|
    
    mern.vm.provider "docker" do |d|

      # Map to host vagrant machine 
      d.vagrant_machine = "host"
      d.vagrant_vagrantfile = host_vagrantfile
      d.force_host_vm = force_host_vm

      d.build_dir = "../mern"
      d.name = "node"
      d.link("mongodb:mongodb")

      # d.ports =["8000:8000"]
      d.remains_running = true
    end
    mern.vm.hostname = "node"
    mern.vm.network "forwarded_port", guest: 8000, host: 8000
    mern.vm.network "forwarded_port", guest: 8080, host: 8080
    mern.vm.synced_folder "../mern/app", "/usr/src/app"
  end


  # config.vm.define "dev", primary: true do |dev|
	
	# 	dev.vm.provider "docker" do |d|
  #     d.build_dir = "./docker/dev"
	# 		d.name = "dev"

	# 		d.link("node:node")

	# 		d.vagrant_machine = "host"
	# 		d.vagrant_vagrantfile = host_vagrantfile
	# 		d.force_host_vm = force_host_vm
			
	# 		d.ports =["6800:6800"]
  #     d.has_ssh = true;
	# 	end
		
	# 	dev.vm.synced_folder "../Price-Comparison", "/root/price"
		
	# 	# dev.vm.network "forwarded_port", guest: 6800, host: 6800
	# 	dev.vm.hostname = "dev"
	# end

	# config.ssh.username = 'root'
	# config.ssh.private_key_path = 'insecure_key'

end

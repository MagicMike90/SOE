ENV['VAGRANT_DEFAULT_PROVIDER'] = "docker"

host_vagrantfile = "host/Vagrantfile"
force_host_vm = TRUE

Vagrant.configure("2") do |config|

	# # -------------- MySQL server --------------

	# config.vm.define "mysql" do |mysql|
	
	# 	mysql.vm.provider "docker" do |d|
	# 		d.image = "mysql"
	# 		d.name = "mysql"
	# 		# d.build_dir = "docker/mysql"
	# 		d.env = {
	# 			:MYSQL_ROOT_PASSWORD => "root",
	# 			:MYSQL_DATABASE      => "dockertest",
	# 			:MYSQL_USER          => "dockertest",
	# 			:MYSQL_PASSWORD      => "d0cker"
	# 		}
	# 		d.ports =["3306:3306"]
	# 		d.remains_running = "true"

	# 		d.vagrant_machine = "docker-provider"
	# 		d.vagrant_vagrantfile = host_vagrantfile
	# 		d.force_host_vm = force_host_vm
	# 	end
		
	# 	mysql.vm.synced_folder ".", "/vagrant", disabled: true
		
	# 	mysql.vm.network "forwarded_port", guest: 3306, host: 3306
	# 	mysql.vm.hostname = "mysql"
	# end
	
	# -------------- Dev machine --------------

	config.vm.define "dev", primary: true do |dev|
	
		dev.vm.provider "docker" do |d|
			d.image = "ubuntu"
			# d.build_dir = "docker/dev"
			d.name = "dev"
			# d.link("mysql:mysql")
			d.vagrant_machine = "host"
			d.vagrant_vagrantfile = host_vagrantfile
			d.force_host_vm = force_host_vm
			d.has_ssh = true
		end
		
		dev.vm.synced_folder ".", "/root/book"
		
		dev.vm.network "forwarded_port", guest: 6800, host: 6800
		dev.vm.network "forwarded_port", guest: 29324, host: 29325, auto_correct: true
		dev.vm.hostname = "dev"
	end

	# config.ssh.username = 'root'
	# config.ssh.private_key_path = 'insecure_key'
end

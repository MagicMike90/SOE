# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
force_host_vm = TRUE

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define "database" do |db|
        db.vm.provider "docker"do |d|
            d.vagrant_vagrantfile = "./host/Vagrantfile"
            d.image = "mysql"
            d.name = 'mysql'
            d.force_host_vm = force_host_vm

            d.env = {
                :MYSQL_ROOT_PASSWORD => "root",
                :MYSQL_DATABASE => "dockertest",
                :MYSQL_USER => "dockertest",
                :MYSQL_PASSWORD => "d0cker"
            }
            d.ports =["3306:3306"]
            d.remains_running = "true"
        end
    end
end
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rubygems'
require 'json'

Vagrant.configure("2") do |config|

   config.vm.box = "CentOS6.4"

   config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
   end

   config.vm.network :private_network, ip: "192.168.33.10"



   VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'vagrant.json').read)

   config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ['site-cookbooks', 'cookbooks']
      chef.roles_path = 'roles'
      chef.data_bags_path = 'data_bags'
      chef.provisioning_path = '/tmp/vagrant-chef'

      chef.json = VAGRANT_JSON

      VAGRANT_JSON['run_list'].each do |recipe|
         chef.add_recipe(recipe)
      end if VAGRANT_JSON['run_list']
   end
end

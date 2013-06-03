#
# Cookbook Name:: networking
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

ifconfig "192.168.11.15" do
   device "eth1"
end

service "network" do
   action :restart
end

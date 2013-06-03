#
# Cookbook Name:: iptables_rules
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

simple_iptables_rule "ssh" do
   rule "--proto tcp --dport 22"
   jump "ACCEPT"
end

simple_iptables_rule "postgres" do
   rule "--proto tcp --dport 5432"
   jump "ACCEPT"
end

simple_iptables_rule "http" do
   rule ["--proto tcp --dport 80",
         "--proto tcp --dport 443"]
   jump "ACCEPT"
end

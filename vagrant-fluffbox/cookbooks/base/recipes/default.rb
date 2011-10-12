#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# This gem is necessary for Chef shadow password management to work
gem_package "libshadow" do 
  action :install
end

user "fluffbox" do
  comment "Fluffbox Deployer"
  home "/home/fluffbox"
  shell "/bin/bash"
  password "$1$Z4H/cwr8$AAUjbPhfUy6xpObPKMNQX."
  action :create
end

directory "/home/fluffbox" do
  owner "fluffbox"
  group "fluffbox"
  mode "0755"
  action :create
end

directory "/home/fluffbox/.ssh" do
  owner "fluffbox"
  group "fluffbox"
  mode "0755"
  action :create
end

directory "/u" do
  owner "fluffbox"
  group "fluffbox"
  mode "0755"
  action :create
end

cookbook_file "/home/fluffbox/.ssh/authorized_keys" do
  source "mstine/authorized_keys"
  mode "0644"
end

group "tomcat6" do
  members ['tomcat6', 'fluffbox']
end

group "admin" do
  members ['vagrant', 'fluffbox']
end

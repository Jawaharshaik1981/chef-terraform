#
# Cookbook:: motd
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/motd" do
source "motd.erb"
mode "0644"
end

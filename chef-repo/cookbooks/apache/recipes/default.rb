#setenforce 0
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

package 'httpd' do
  action :install
end
#node.default["apache"]["indexfile"] = "index.html"
=begin
#cookbook_file "/var/www/html/index.html" do
  #source "index.html"
  #source node["apache"]["indexfile"]
  #mode "0644"
#end
=end

execute "mv /etc/httpd/conf.d/welcome.conf  /etc/httpd/conf.d/welcome.conf.disabled" do
  only_if do
    File.exist?("/etc/httpd/conf.d/welcome.conf")
  end
  notifies :restart, "service[httpd]"
end
# iterates over the apache sites
node["apache"]["sites"].each do |site_name,site_data|
#set the document root
  document_root = "/srv/apache/#{site_name}"
# Add template for Apache Virtual host configuration
  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source "custom.erb"
    mode "0777"
    variables(
      :document_root => document_root,
      :port => site_data["port"]
    )
    notifies :restart, "service[httpd]"
  end
# Add a directory resource to create the document_root
  directory document_root do
    mode = "0755"
    recursive true
  end
# Add a template resource for the virtual host's index.html
  template "#{document_root}/index.html" do
    source "index.html.erb"
    mode "0777"
    variables(
      :site_name => site_name,
      :port => site_data["port"]
    )
  end
end
service 'httpd' do
  action [ :enable, :start ]
end


#
# Cookbook Name:: monitor
# Recipe:: apache
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

directory '/srv' do
  action :create
end

template '/srv/index.html' do
  source 'index.html.erb'
end

include_recipe 'docker'
include_recipe 'docker::cgroups'

docker_image 'httpd' do
  tag '2.4'
end

docker_container 'httpd' do
  action :run
  tag '2.4'
  detach true
  port '80:80'
  volume '/srv:/usr/local/apache2/htdocs'
end

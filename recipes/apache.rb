#
# Cookbook Name:: monitor
# Recipe:: apache
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'monitor::yum'

directory '/srv' do
  action :create
end

template '/srv/index.html' do
  source 'index.html.erb'
end

include_recipe 'docker'
include_recipe 'docker::cgroups'

docker_image 'httpd' do
  cmd_timeout 300
  retries 3
end

docker_container 'httpd' do
  action :run
  tag '2.4'
  detach true
  port '80:80'
  volume '/srv:/usr/local/apache2/htdocs'
end

include_recipe 'sensu::default'

sensu_role = %w(httpd all)

sensu_client node.hostname do
  address node.ipaddress
  subscriptions node.roles + sensu_role
end

include_recipe 'monitor::sensu_common'
include_recipe 'sensu::client_service'
include_recipe 'monitor::checks'

#
# Cookbook Name:: monitor
# Recipe:: sensu_common
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Clone community gem.

git '/etc/sensu/community-plugins' do
  repository 'https://github.com/sensu/sensu-community-plugins.git'
  revision 'master'
  action :sync
end

git '/etc/sensu/plugins' do
  repository 'https://github.com/sensu-plugins/sensu-plugin.git'
  revision 'master'
  action :sync
end

sensu_gem 'redis'

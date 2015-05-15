#
# Cookbook Name:: monitor
# Recipe:: sensu
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'sensu::default'
include_recipe 'sensu::rabbitmq'
include_recipe 'sensu::redis'
include_recipe 'sensu::server_service'

sensu_client node.hostname do
  address node.ipaddress
  subscriptions node.roles + ['all']
end

include_recipe 'sensu::client_service'
include_recipe 'sensu::api_service'

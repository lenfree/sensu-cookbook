#
# Cookbook Name:: monitor
# Recipe:: sensu
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'sensu::default'
include_recipe 'sensu::rabbitmq'
include_recipe 'sensu::redis'
include_recipe 'sensu::server_service'

sensu_role = %w(redis all)

sensu_client node.hostname do
  address node.ipaddress
  subscriptions node.roles + sensu_role
end

include_recipe 'sensu::client_service'
include_recipe 'sensu::api_service'

include_recipe 'monitor::sensu_common'

include_recipe 'monitor::checks'

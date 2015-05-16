#
# Cookbook Name:: monitor
# Recipe:: checks
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

sensu_check 'redis_process' do
  command '/etc/sensu/community-plugins/plugins/redis/check-redis-ping.rb -h 127.0.0.1 -p 6379'
  handlers ['default']
  subscribers ['redis']
  interval 30
end

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

sensu_check 'httpd_container' do
  command '/etc/sensu/community-plugins/plugins/http/check-httpd.rb \
    -h 127.0.0.1 -P 80 -p index.html --response-code 200'
  handlers ['default']
  subscribers ['httpd']
  interval 30
end

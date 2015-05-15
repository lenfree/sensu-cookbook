#
# Cookbook Name:: monitor
# Recipe:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

group 'sensu'

user 'sensu' do
  gid 'sensu'
  shell '/bin/bash'
  system true
end

# By default, vagrant have exclude kernel upgrade
ruby_block 'delete_line' do
  block do
    file = Chef::Util::FileEdit.new('/etc/yum.conf')
    file.search_file_delete_line('^exclude.*')
    file.write_file
  end
end

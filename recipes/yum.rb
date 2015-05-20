#
# Cookbook Name:: monitor
# Recipe:: yum
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

ruby_block 'delete_line' do
  block do
    file = Chef::Util::FileEdit.new('/etc/yum.conf')
    file.search_file_delete_line('^exclude.*')
    file.write_file
  end
end

execute 'yum-update' do
  command 'yum -y update'
  only_if { platform_family?('rhel') }
end

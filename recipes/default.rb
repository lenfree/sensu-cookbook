#
# Cookbook Name:: monitor
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'monitor::user'
include_recipe 'monitor::sensu'

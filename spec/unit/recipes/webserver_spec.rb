#
# Cookbook Name:: web_application
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'web_application::webserver' do
  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['web_application']['root_dir'] = '/srv/apache/customers'
    end.converge(described_recipe)
  end

  context 'provision a webserver' do

    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  end
end

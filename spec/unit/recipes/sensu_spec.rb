#
# Cookbook Name:: web_application
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'monitor::sensu' do
  context 'configuring sensu' do
    before do
      stub_command('service sensu restart').and_return(true)
    end

    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe) }

    it 'should include sensu recipe' do
      expect(chef_run).to include_recipe('sensu::default')
    end

    it 'should include rabbitmq recipe' do
      expect(chef_run).to include_recipe('sensu::rabbitmq')
    end

    it 'should include redis recipe' do
      expect(chef_run).to include_recipe('sensu::redis')
    end

    it 'should include sensu server service' do
      expect(chef_run).to include_recipe('sensu::server_service')
    end

    it 'should include sensu client service' do
      expect(chef_run).to include_recipe('sensu::client_service')
    end

    it 'should include sensu api service' do
      expect(chef_run).to include_recipe('sensu::api_service')
    end

#    it 'should notify sensu server' do
#      resource = chef_run.package('sensu-server')
#      expect(resource).to notify('service[sensu-server]').to(:restart)
#    end
  end
end

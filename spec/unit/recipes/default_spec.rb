#
# Cookbook Name:: monitor
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'monitor::default' do
  context 'When minimal sensu server is configured' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe) }

    it 'should include user recipe' do
      expect(chef_run).to include_recipe('monitor::user')
    end

    it 'should include sensu recipe' do
      expect(chef_run).to include_recipe('monitor::sensu')
    end

    it 'should include user recipe' do
      expect(chef_run).to include_recipe('monitor::sensu_common')
    end
  end
end

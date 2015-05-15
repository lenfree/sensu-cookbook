#
# Cookbook Name:: monitor
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'monitor::user' do
  context 'sensu server host user' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['sensu']['user'] = 'sensu'
        node.set['sensu']['group'] = 'sensu'
      end.converge(described_recipe)
    end

    it 'should create group' do
      expect(chef_run).to create_group('sensu')
    end

    it 'should create user' do
      expect(chef_run).to create_user('sensu').with(shell: '/bin/bash')
    end
  end
end

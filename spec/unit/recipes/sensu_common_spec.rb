#
# Cookbook Name:: monitor
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'monitor::sensu_common' do
  context 'configure sensu plugins' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe) }

    it 'should clone plugin from github' do
      expect(chef_run).to sync_git('/etc/sensu/community-plugins').with(
        repository: 'https://github.com/sensu/sensu-community-plugins.git')
    end

    it 'should install sensu gem' do
      expect(chef_run).to sync_git('/etc/sensu/plugins').with(
        repository: 'https://github.com/sensu-plugins/sensu-plugin.git')
    end
  end
end

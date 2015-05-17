#
# Cookbook Name:: monitor
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'monitor::apache' do
  context 'configure apache' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe) }

    it 'should create /srv directory' do
      expect(chef_run).to create_directory('/srv')
    end

    it 'should have index.html' do
      expect(chef_run).to create_template('/srv/index.html')
    end

    it 'should install docker' do
      expect(chef_run).to include_recipe('docker')
    end

    it 'should install docker aufs' do
      expect(chef_run).to include_recipe('docker::aufs')
    end
  end
end

#
# Cookbook Name:: monitor
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'monitor::yum' do
  context 'common yum packages' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it 'should upgrade kernel' do
      expect(chef_run).to run_execute('yum -y update')
    end
  end
end

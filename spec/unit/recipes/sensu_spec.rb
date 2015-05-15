#
# Cookbook Name:: web_application
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'web_application::user' do
  context 'create application group' do
    let(:chef_run) { ChefSpec::SoloRunner.new }

    it 'should create group' do
      chef_run.node.set['web_application']['group'] = 'web_admin'
      chef_run.converge(described_recipe)

      expect(chef_run).to create_group('web_admin')
    end
  end
end

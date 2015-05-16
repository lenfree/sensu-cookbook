# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
# rubocop:disable all
BOX_URL="centos6_min"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "monitor" do |node|
    node.vm.box = "centos6_min"
    node.vm.box_url = "#{BOX_URL}"
    node.vm.hostname = 'sensu-server'
  end

  config.vm.define "node2" do |node|
    node.vm.box = "centos6_min"
    node.vm.box_url = "#{BOX_URL}"
    node.vm.hostname = 'node2'
  end

  config.vm.network :public_network,  auto_config: true
end

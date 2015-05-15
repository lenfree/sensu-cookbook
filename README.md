# monitor
==========

Use sensu cookbook from supermarket to configure sensu server.

Getting started
================
Make sure you have chef-dk downloaded, chef.io account and configured knife.rb and key in .chef directory.

Deploy:
```
vagrant up monitor
knife bootstrap <ip> --ssh-user vagrant --ssh-password vagrant --sudo --use-sudo-password --node-name sensu_server --run-list 'recipe[monitor::default]'
```

Development:
```
bundle install
guard
berks install
berks update
berks upload
```

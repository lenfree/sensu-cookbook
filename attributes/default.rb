default['sensu']['user'] = 'sensu'
default['sensu']['group'] = 'sensu'
default['sensu']['use_ssl'] = false
default['sensu']['use_embedded_ruby'] = 'true'
default['sensu']['rabbitmq']['host'] = '192.168.0.40' # should use shortname
default['sensu']['rabbitmq']['vhost'] = 'sensu'
default['sensu']['rabbitmq']['user'] = 'rabbitmq'
default['sensu']['rabbitmq']['password'] = 'rabbitmq'
default['sensu']['rabbitmq']['port'] = '5672'
default['sensu']['redis']['host'] = '127.0.0.1' # use shortname
default['sensu']['redis']['port'] = '6379'
default['sensu']['api']['host'] = '127.0.0.1' # use shortname
default['sensu']['api']['port'] = 4567
default['sensu']['api']['bind'] = '0.0.0.0'

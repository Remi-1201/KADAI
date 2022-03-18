server '3.112.17.6', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/remi/.ssh/id_rsa'
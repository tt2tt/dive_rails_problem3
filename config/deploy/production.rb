server '52.192.165.134', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/tanakatarou/.ssh/id_rsa'

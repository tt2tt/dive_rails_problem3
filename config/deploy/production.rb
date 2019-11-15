server '3.115.45.234', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/tanakatarou/.ssh/id_rsa'

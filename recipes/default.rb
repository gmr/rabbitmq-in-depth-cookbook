#
# Cookbook Name:: rabbitmq-in-depth
# Recipe:: default
#
# Copyright 2013 Manning Publications
#

# Ensure the libraries used in the Python examples are always up to date
%w[pika pamqp rabbitpy].each do |pkg|
  python_pip pkg do
    action [:install, :upgrade]
  end
end

# Reset the permissions on the git clone
execute 'fix-permissions' do
  action  :nothing
  command 'chown -R vagrant:vagrant /opt/rabbitmq-in-depth; chmod og+rwx /opt/rabbitmq-in-depth /opt/rabbitmq-in-depth/notebooks /opt/rabbitmq-in-depth/Examples'
end

# Clone the git resources for the book
git '/opt/rabbitmq-in-depth' do
  repository 'https://github.com/gmr/RabbitMQ-in-Depth.git'
  revision  'HEAD'
  action    :sync
  notifies  :run, 'execute[fix-permissions]'
end

# Remove any extraneous packages
execute 'package-cleanup' do
  command 'apt-get -y autoremove'
end

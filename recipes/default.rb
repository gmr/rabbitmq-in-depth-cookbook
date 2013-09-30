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

git '/opt/rabbitmq-in-depth' do
  repository 'https://github.com/gmr/RabbitMQ-in-Depth.git'
  revision  'HEAD'
  action    :sync
  owner     'vagrant'
  group     'vagrant'
end

execute 'package-cleanup' do
  command 'apt-get -y autoremove'
end

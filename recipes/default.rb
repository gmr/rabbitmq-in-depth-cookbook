#
# Cookbook Name:: rabbitmq-in-depth
# Recipe:: default
#
# Copyright 2013 Manning Publications
#

# Make sure apt caches, etc are up to date
execute 'aptitude-update' do
    command 'apt-get update'
end

# Ensure the libraries used in the Python examples are always up to date
%w[pika pamqp rabbitpy mosquitto stomp.py].each do |pkg|
  python_pip pkg do
    action :upgrade
  end
end

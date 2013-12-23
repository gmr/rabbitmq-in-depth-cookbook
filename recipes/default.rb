#
# Cookbook Name:: rabbitmq-in-depth
# Recipe:: default
#
# Copyright 2013 Manning Publications
#

# Ensure the libraries used in the Python examples are always up to date
%w[pika pamqp rabbitpy mosquitto].each do |pkg|
  python_pip pkg do
    action :upgrade
  end
end

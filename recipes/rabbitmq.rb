#
# Cookbook Name:: rabbitmq-in-depth
# Recipe:: ipython
#
# Copyright 2013 Manning Publications
#
include_recipe "rabbitmq::default"

plugins = %w[rabbitmq_management
             rabbitmq_management_visualiser
             rabbitmq_consistent_hash_exchange
             rabbitmq_federation
             rabbitmq_federation_management
             rabbitmq_mqtt
             rabbitmq_shovel
             rabbitmq_shovel_management
             rabbitmq_stomp
             rabbitmq_tracing
             rabbitmq_web_stomp
             rabbitmq_web_stomp_examples]

service_name = node[:rabbitmq][:service_name]

plugins.each do |plugin|
  rabbitmq_plugin plugin do
    action :enable
    notifies :restart, "service[#{service_name}]", :delayed
  end
end

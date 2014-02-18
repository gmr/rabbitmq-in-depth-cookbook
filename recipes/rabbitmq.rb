#
# Cookbook Name:: rabbitmq-in-depth
# Recipe:: rabbitmq
#
# Copyright 2013 Manning Publications
#
service_name = node[:rabbitmq][:service_name]

file '/var/lib/rabbitmq/.erlang.cookie' do
    action  :nothing
    content "XBCDDYAVPRVEYREVJLXS\n"
    owner 'rabbitmq'
    group 'rabbitmq'
    mode  0400
    notifies :start, "service[#{service_name}]", :immediate
end

service node[:rabbitmq][:service_name] do
    action :stop
    notifies :create, "file[/var/lib/rabbitmq/.erlang.cookie]", :immediate
end

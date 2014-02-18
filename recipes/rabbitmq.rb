#
# Cookbook Name:: rabbitmq-in-depth
# Recipe:: rabbitmq
#
# Copyright 2013 Manning Publications
#
execute 'update-cookie' do
    command 'service rabbitmq-server stop; echo "XBCDDYAVPRVEYREVJLXS" > /var/lib/rabbitmq/.erlang.cookie; service rabbitmq-server start'
end


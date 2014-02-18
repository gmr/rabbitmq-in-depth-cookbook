#
# Cookbook Name:: rabbitmq-in-depth
# Recipe:: statelessd
#
# Copyright 2013 Manning Publications

python_pip 'statelessd' do
  action :upgrade
  notifies :restart, 'service[statelessd]', :delayed
end

user 'statelessd' do
  system true
  shell "/bin/false"	
end

cookbook_file '/etc/init.d/statelessd' do
  action :create
  owner  'statelessd'
  mode   0744
  source 'statelessd.sh'
  notifies :restart, 'service[statelessd]', :delayed
end

cookbook_file '/etc/statelessd.yaml' do
  action :create
  owner  'statelessd'
  mode   0644
  source 'statelessd.yaml'
  notifies :restart, 'service[statelessd]', :delayed
end

service 'statelessd' do
	supports :status => true, :restart => true	
	action [:enable, :start]
end
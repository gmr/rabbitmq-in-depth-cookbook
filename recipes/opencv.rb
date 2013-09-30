#
# Cookbook Name:: rabbitmq-in-depth
# Recipe:: opencv
#
# Copyright 2013 Manning Publications
#
%w[libjpeg8 python-imaging python-opencv].each do |pkg|
    package pkg do
        action :install
    end
end

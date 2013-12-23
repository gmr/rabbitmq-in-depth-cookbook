# Clone the git resources for the book
git '/opt/rabbitmq-in-depth' do
  repository 'https://github.com/gmr/RabbitMQ-in-Depth.git'
  revision   'HEAD'
  action     :sync
  notifies  :run, 'execute[fix-permissions]'
end

# Reset the permissions on the git clone
execute 'fix-permissions' do
  action  :nothing
  command 'chown -R vagrant:vagrant /opt/rabbitmq-in-depth; chmod og+rwx /opt/rabbitmq-in-depth'
end

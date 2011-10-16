gem_package "mysql" do
  action :install
end

# create connection info as an external ruby hash
mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}

# create a mysql database
mysql_database 'fluffbox' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'fluffbox' do
  connection mysql_connection_info
  password 'fluffbox'
  database_name 'fluffbox'
  host '33.33.33.11'
  action :grant
end

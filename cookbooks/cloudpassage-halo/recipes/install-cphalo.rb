template "/etc/yum.repos.d/cloudpassage.repo" do
  source "cloudpassage.repo.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
end
 
bash "import cloudpassage key" do
  code <<-EOH
rpm --import http://packages.cloudpassage.com/cloudpassage.packages.key
EOH
end
 
bash "yum check-update" do
  returns [0, 100]
  code <<-EOH
yum check-update > /dev/null
EOH
end
 
# install cphalo
service 'cphalo' do
  service_name 'cphalod'
  action :nothing
end
 
package 'cphalo'  do
  action :install
  notifies :enable, 'service[cphalo]', :immediately
end
 
# this is for testing purposes.
#bash "starting cphalo daemon" do
#not_if { `ps -ef |  grep -v grep | grep -c cphalo` =~ /2/ }
#  code <<-EOH
#/etc/init.d/cphalod start --daemon-key=#{node['cloudpassage-key']}
#EOH
#end

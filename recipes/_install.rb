#
# Cookbook Name:: jiggy-proxy
# Recipe:: install
#

include_recipe 'apache2::default'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'
include_recipe 'apache2::mod_proxy_balancer'
include_recipe 'apache2::mod_proxy_wstunnel'
include_recipe 'apache2::mod_proxy_html'
include_recipe 'apache2::mod_rewrite'

service 'apache2' do
  action %I[enable start]
end

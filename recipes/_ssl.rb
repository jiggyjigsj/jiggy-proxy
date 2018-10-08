#
# Cookbook Name:: jiggy-proxy
# Recipe:: ssl
#
# Include the recipe to install the gems
include_recipe 'acme'

# Set up contact information. Note the mailto: notation
node.override['acme']['contact'] = node.default['jiggy-proxy']['contact']

# Real certificates please...
node.override['acme']['endpoint'] = node.default['jiggy-proxy']['endpoint']

# 'https://acme-staging.api.letsencrypt.org'
# 'https://acme-v01.api.letsencrypt.org'
raise 'Site needs to be defined!' if node.default['jiggy-proxy']['site'].empty?
site = node.default['jiggy-proxy']['site']
raise 'Sans needs to be defined!' if node.default['jiggy-proxy']['site'].empty?
sans = node.default['jiggy-proxy']['sans']

# Generate a self-signed if we don't have a cert to prevent bootstrap problems
acme_selfsigned site.to_s do
  crt     "/etc/ssl/certs/#{site}.crt"
  key     "/etc/ssl/certs/#{site}.key"
  chain   "/etc/ssl/certs/#{site}.pem"
  owner   'root'
  group   'root'
  notifies :restart, 'service[apache2]', :immediate
end

# Set up your webserver here...
template '/etc/apache2/sites-available/default-ssl.conf' do
  source 'default-ssl.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template '/etc/apache2/sites-available/000-default.conf' do
  source '000-default.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

link '/etc/apache2/sites-enabled/000-default.conf' do
  to '/etc/apache2/sites-available/000-default.conf'
end

link '/etc/apache2/sites-enabled/default-ssl.conf' do
  to '/etc/apache2/sites-available/default-ssl.conf'
end

# Get and auto-renew the certificate from Let's Encrypt
acme_certificate site.to_s do
  crt               "/etc/ssl/certs/#{site}.crt"
  key               "/etc/ssl/certs/#{site}.key"
  chain             "/etc/ssl/certs/#{site}.pem"
  wwwroot           '/var/www/html'
  notifies :restart, 'service[apache2]'
  alt_names sans
end

service 'apache2' do
  action :restart
end

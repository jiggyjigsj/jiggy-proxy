name 'jiggy-proxy'
maintainer 'The Authors'
maintainer_email 'jjp1023@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures jiggy-proxy'
long_description 'Installs/Configures jiggy-proxy'
version '0.2.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'apache2', '~> 5.0.1'
depends 'acme', '~> 4.0.0'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/jiggy-proxy/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/jiggy-proxy'

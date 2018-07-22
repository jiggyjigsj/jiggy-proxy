# jiggy-proxy

Cookbook to host my proxy node utilizing chef.  It will build out install `apache2` and land a cert using `acme`.

Currently only handles static configuration.  Will focus on manual changes as needed.

## Proxy Passes

* https://hpesxi01.jiggy.com
* https://owncloud.jiggy.com

# TODO:

* Modify the cookbook to handle attributes.
* Write test and utilize the `kitchen` tests.
* Move to `nginx` as console in `ESXi` is not supported using `modules`

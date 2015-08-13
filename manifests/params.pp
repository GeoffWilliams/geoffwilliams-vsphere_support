class vsphere_support::params {

  # Packages to install with native os package management
  $packages = [
    "zlib-devel",
    "libxslt-devel",
    "patch",
    "gcc"
  ]

  # package to install with gem
  $gem_packages = [ 
    "rbvmomi", 
    "hocon"
  ]

  # final path for config file
  $config_file = "/etc/puppetlabs/puppet/vcenter.conf"

  # provider to use with `package` to install rubygems
  $gem_provider = "puppet_gem"
}

class vsphere_support::params {
  $packages = [
    "zlib-devel",
    "libxslt-devel",
    "patch",
    "gcc"
  ]

  $gem_packages = [ 
    "rbvmomi", 
    "hocon"
  ]

  $config_file = "/etc/puppetlabs/puppet/vcenter.conf"

  $gem_provider = "puppet_gem"
}

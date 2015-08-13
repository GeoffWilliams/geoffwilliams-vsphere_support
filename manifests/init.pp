# Class: vsphere_support
# ===========================
#
# Install prerequisites for the `puppetlabs-vsphere` module
#
# Parameters
# ----------
# [*vcenter_host*]
#   Hostname or IP address of vcenter server
# [*vcenter_user*]
#   User to login to vcenter as
# [*vcenter_password*]
#   Password to login to vcenter with
# [*vcenter_port*]
#   Port for vcenter API
# [*package*]
#   List of packages to install
# [*gem_packages*]
#   List of rubygems to install
# [*config_file*]
#   Final system path for vcenter.conf
# [*gem_provider*]
#   Provider to use for package resources installed using gem
# [*vcenter_insecure*]
#   Used directly by vsphere module - see https://forge.puppetlabs.com/puppetlabs/vsphere
# [*vcenter_ssl*]
#   Used directly by vsphere module - see https://forge.puppetlabs.com/puppetlabs/vsphere
# Authors
# -------
#
# Geoff Williams <geoff.williams@puppetlabs.com>
#
# Copyright
# ---------
#
# Copyright 2015 Puppet Labs, unless otherwise noted.
#
class vsphere_support(
    $vcenter_host,
    $vcenter_user,
    $vcenter_password,
    $vcenter_port,
    $packages    = $vsphere_support::params::packages,
    $gem_packages= $vsphere_support::params::gem_packages,
    $config_file = $vsphere_support::params::config_file,
    $gem_provider= $vsphere_support::params::gem_provider,
    $vcenter_insecure = false,
    $vcenter_ssl = false,
) inherits vsphere_support::params {

  File {
    owner => "root",
    group => "root",
    mode  => "0600",
  }

  package { $packages:
    ensure => present,
  }

  file { $config_file:
    ensure  => file,
    content => template("${module_name}/vcenter.conf.erb"),
  }

  package { $gem_packages:
    ensure   => installed,
    provider => $gem_provider,
  }
}

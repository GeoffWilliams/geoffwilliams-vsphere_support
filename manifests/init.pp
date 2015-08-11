# Class: vsphere_support
# ===========================
#
# Full description of class vsphere_support here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'vsphere_support':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class vsphere_support(
    $packages    = $vsphere_support::params::packages,
    $gem_packages= $vsphere_support::params::gem_packages,
    $config_file = $vsphere_support::params::config_file,
    $gem_provider= $vsphere_support::params::gem_provider,
    $vsphere_host,
    $vspere_user,
    $vsphere_password,
    $vsphere_port,
    $vsphere_insecure = false,
    $vsphere_ssl = false,
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
    content => template("${module_name}/vsphere.conf.erb"),
  }

  package { $gem_packages:
    ensure   => installed,
    provider => $gem_provider,
  }
}

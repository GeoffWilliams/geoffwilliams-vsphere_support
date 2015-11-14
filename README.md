# vsphere_support
[![Build Status](https://travis-ci.org/GeoffWilliams/geoffwilliams-vsphere_support.svg)](https://travis-ci.org/GeoffWilliams/geoffwilliams-vsphere_support)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with vsphere_support](#setup)
    * [What vsphere_support affects](#what-vsphere_support-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with vsphere_support](#beginning-with-vsphere_support)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Install the package requirements of the vpshere module and configure the module
by creating `vcenter.conf` containing the logon details for the VCenter server.

## Setup

### What vsphere_support affects

* Installs software requirements for the [puppetlabs-vsphere](https://forge.puppetlabs.com/puppetlabs/vsphere) 
  module
* Creates a file at `/etc/puppetlabs/puppet/vcenter.conf` which is needed to
  configure `puppetlabs-vsphere` to connect to VCenter for VM provisioning

## Usage
Install all software requirements and configure connection to VCenter.  Hiera
users are recommended to configure [hiera-eyaml](https://github.com/TomPoulton/hiera-eyaml)
to encrypt the vcenter_password in git.

```puppet
class { "vsphere_support":
  vcenter_host     => "vsphere.megacorp.com",
  vcenter_user     => "admin",
  vcenter_password => "topsecret",
  vcenter_port     => 9999
}
```

## Limitations
* Not supported by Puppet Labs

## Development
Pull Requests welcome

## Testing
This module ships with RSpec tests.  To run them, first prepare your system:
```shell
bundle install
```

You may then run the tests at will.  If downloading from GitHub from behind a
proxy server, you will need to have your `http_proxy` and `https_proxy` 
variables exported
```shell
bundle exec rake spec
```

It is suggested to have your CI server execute these tests before allowing code
to be published to the puppet master


# Install all software and create a vcenter.conf file
class { "vsphere_support":
  vcenter_host     => "vsphere.megacorp.com",
  vcenter_user     => "admin",
  vcenter_password => "topsecret",
  vcenter_port     => 9999,
}

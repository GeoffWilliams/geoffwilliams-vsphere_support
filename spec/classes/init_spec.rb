require 'spec_helper'
describe 'vsphere_support' do
  let :params do
    {
      "vcenter_host"     => "vsphere.megacorp.com",
      "vcenter_user"     => "admin",
      "vcenter_password" => "topsecret",
      "vcenter_port"     => 9999
    }
  end
  context 'compile ok' do
    it do
      expect { should compile }.not_to raise_error
    end
  end
end

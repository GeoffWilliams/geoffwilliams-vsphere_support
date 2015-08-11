require 'spec_helper'
describe 'vsphere_support' do

  context 'with defaults for all parameters' do
    it { should contain_class('vsphere_support') }
  end
end

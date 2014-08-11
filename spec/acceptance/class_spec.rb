require 'spec_helper_acceptance'

describe 'eracom_hsm class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'eracom_hsm': }
      EOS

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe package('eracom_hsm') do
      it { should be_installed }
    end

    describe service('eracom_hsm') do
      it { should be_enabled }
      it { should be_running }
    end
  end
end
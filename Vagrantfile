# -*- mode: ruby -*-
# vi:ft=ruby;sw=2;
Vagrant::Config.run do |config|
  config.vm.box_url = 'http://goo.gl/8kWkm'
  config.vm.box = 'precise32'

  config.vm.forward_port 8081, 8081

  # Useful for when working with multiple VMs
  #config.vm.network :hostonly, "33.33.33.11"

  # This shell provisioner installs librarian-puppet and runs it to install
  # puppet modules. This has to be done before the puppet provisioning so that
  # the modules are available when puppet tries to parse its manifests.
  config.vm.provision :shell, :path => "Vagrant/puppet-librarian.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "Vagrant/manifests"
    puppet.manifest_file  = "default.pp"
  end
end


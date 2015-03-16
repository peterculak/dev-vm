Vagrant.configure("2") do |config|
  config.vm.box = "tribe-dev-vm"
  config.vm.network :private_network, ip: "10.0.0.10"
  config.vm.synced_folder "../www/", "/var/www/", type: "nfs"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  end
end

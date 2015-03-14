Vagrant.configure("2") do |config|
  config.vm.box = "tribe-dev-vm"
  config.vm.network :forwarded_port, host: 5000, guest: 81
  config.vm.synced_folder "../src/", "/var/www", owner: "www-data", group: "www-data", :mount_options =>
  ["dmode=777","fmode=777"]

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  end
end

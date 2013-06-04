# Vagrant file specific for version 2
Vagrant.configure("2") do |config|
    
    # I use a 64-bit Ubuntu  box, equal to my production environment
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config.vm.hostname = "developmentbox"
    config.vm.network :private_network, ip: "10.11.12.13"
    
    # Specify folder which you would like to have available in your box
    config.vm.synced_folder ".", "/vagrant"

    # In case speed is lacking, try the NFS option
    #config.vm.synced_folder ".", "/vagrant", :nfs => true
    
    # Specific configuration options for Virtualbox
    config.vm.provider "virtualbox" do |v|
        
        # Show gui instead of default, which is headless
        v.gui = true

        # Use modern chipset
        v.customize ["modifyvm", :id, "--chipset", "ich9"]
        
        # Increase default memory size
        v.customize ["modifyvm", :id, "--memory", 1024]
        
        # Dual core
        v.customize ["modifyvm", :id, "--cpus", 2]
    end
end

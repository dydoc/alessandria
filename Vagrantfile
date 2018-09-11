# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

require File.dirname(__FILE__)+"/dependency_manager"
check_plugins ["reload", "vagrant-managed-servers"]


Vagrant.configure("2") do |config|
  config.vm.box = "tknerr/managed-server-dummy"

# this stanza depends from the vagrant plugin vagrant-managed-servers
  config.vm.provider :managed do |managed, override|
    managed.server = "localhost"
    override.ssh.username = ENV['USER']
    override.ssh.private_key_path = "~/.ssh/id_rsa"
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.synced_folder "saltstack/states", "/srv/salt/",  type: "rsync", rsync__auto: true
  config.vm.synced_folder "saltstack/pillars", "/srv/pillar/", type: "rsync", rsync__auto: true


  #adding ssh forwarding agent
  config.ssh.forward_agent = true



  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.install_master = true
    salt.no_minion = false
    salt.minion_id = "localhost"
    salt.minion_config = "saltstack/minion"

 # if you want preseed the master and the minion manually you need 
 # to generate keys for the master and minion:
 # in this case it doesn't make sense.
 #
 #   salt.minion_key = "salt/key/minion.pem"
 #   salt.minion_pub = "salt/key/minion.pub"
 #   salt.master_key = "salt/key/master.pem"
 #   salt.master_pub = "salt/key/master.pub"
 #   salt.seed_master = {
 #           minion: "salt/key/minion.pub",
 #           master: "salt/key/master.pub",
 #       }    
  end


  config.vm.provision "shell",
    inline: "systemctl restart salt-minion && sleep 4 && salt-key --accept-all -y"

end

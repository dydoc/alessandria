Vagrant.configure("2") do |config|
  config.vm.box = "tknerr/managed-server-dummy"

# this stanza depends from the vagrant plugin vagrant-managed-servers
  config.vm.provider :managed do |managed, override|
    managed.server = "localhost"
    override.ssh.username = "nicolino"
    override.ssh.private_key_path = "~/.ssh/id_rsa"
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true


  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.install_master = true
    salt.no_minion = false
    salt.minion_id = "localhost"
    salt.minion_config = "salt/minion"

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
    inline: "salt-key --accept-all -y"

end

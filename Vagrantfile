Vagrant.configure("2") do |config|
#  config.vm.define "web" do |web|
#    web.vm.box = "ubuntu/trusty64"
#  end
  config.vm.define "puppetmaster" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.provision :shell, path: "bootstrap.sh"
    web.vm.network :forwarded_port, host: 8000, guest: 80
    web.vm.network :forwarded_port, host: 8443, guest: 443
    web.vm.network :forwarded_port, host: 9443, guest: 8443
    web.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 2
    end
  end

#  config.vm.define "db" do |db|
#    db.vm.box = "box-cutter/oel65"
#  end
end

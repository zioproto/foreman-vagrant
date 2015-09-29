Vagrant.configure("2") do |config|
  config.vm.define "foremanserver" do |web|
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

#add more machines here if you need
#  config.vm.define "web" do |web|
#    web.vm.box = "ubuntu/trusty64"
#  end
end

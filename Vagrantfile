Vagrant.configure("2") do |config|
  config.vm.define "web" do |web|
    web.vm.box = "hashicorp/precise64"
  end
  config.vm.define "puppetmaster" do |web|
    web.vm.box = "hashicorp/precise64"
    web.vm.provision :shell, path: "bootstrap.sh"
    web.vm.network :forwarded_port, host: 8000, guest: 80
  end

#  config.vm.define "db" do |db|
#    db.vm.box = "box-cutter/oel65"
#  end
end

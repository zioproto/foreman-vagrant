#!/usr/bin/env bash
apt-get update
apt-get install -y vim htop

apt-get -y install ca-certificates
#wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
#dpkg -i puppetlabs-release-precise.deb

#echo "deb http://deb.theforeman.org/ precise 1.8" > /etc/apt/sources.list.d/foreman.list
#echo "deb http://deb.theforeman.org/ plugins 1.8" >> /etc/apt/sources.list.d/foreman.list
#wget -q http://deb.theforeman.org/pubkey.gpg -O- | apt-key add -
#apt-get update && apt-get -y install foreman-installer

echo "deb http://deb.theforeman.org/ trusty stable" > /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.8" >> /etc/apt/sources.list.d/foreman.list
wget -q http://deb.theforeman.org/pubkey.gpg -O- | apt-key add -
apt-get update && apt-get install -y foreman-installer
ip=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
echo "$ip foreman.example.com foreman" >> /etc/hosts
echo "foreman" > /etc/hostname
hostname --file /etc/hostname
rm -rf /var/lib/puppet/ssl
/usr/bin/puppet cert --generate foreman.example.com
foreman-installer
apt-get install -y ruby-foreman-templates

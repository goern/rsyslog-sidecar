# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://docs.vagrantup.com.
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false

  # https://seven.centos.org/2016/09/updated-centos-vagrant-images-available-v1608-01/ known issue #3
  config.ssh.insert_key = false

  # https://github.com/vagrant-libvirt/vagrant-libvirt
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 4096
    libvirt.cpus = 2
  end

  config.vm.network "forwarded_port", guest: 8443, host: 18443

  config.vm.provision "shell",
    inline: "yum install -y centos-release-openshift-origin docker && yum update -y && systemctl enable docker && systemctl start docker"

  config.push.define "atlas" do |push|
    push.app = "goern/rsyslog-sidecar"
  end

end

#!/bin/bash

# Instalamos en Ubuntu KVM, Libvirt y VirtualManager

sudo apt-get update
sudo apt-get install -y qemu-kvm qemu-system libvirt-bin libvirt-dev bridge-utils

# Añadimos nuestro usuario al grupo libvirt

sudo adduser $USER libvirtd

# Aunque no vayamos a usar VirtualBox lo instalaremos
# por si nos pudiera generar alguna dependencia

sudo apt-get install -y virtualbox virtualbox-dkms

# Instalamos Vagrant y las dependencias para vagrant-kvm y vagrant-libvirt

sudo apt-get install -y ruby1.9.1-dev ruby-libvirt libxslt-dev libxml2-dev build-essential zlibc zlib1g-dev vagrant

# sudo apt-get install -y ruby-full ruby-dev ruby-libvirt rake make ruby-libvirt ruby1.9.3 zlib-bin libxslt-dev libxml2-dev  libvirt-dev
vagrant plugin install vagrant-kvm
#vagrant plugin install vagrant-libvirt
CONFIGURE_ARGS="with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib" vagrant plugin install vagrant-libvirt

# Instalamos la última versión a la fecha de Vagrant

wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
sudo dpkg -i vagrant_1.7.2_x86_64.deb

# Corregimos los futuros problemas de vagrant up --provider libvirt

sudo apt-get install apparmor-profiles apparmor-utils
sudo aa-complain /usr/lib/libvirt/virt-aa-helper

# Hacemos al usuario ubuntu propietario de /home/ubuntu/.vagrant.d

sudo chown -R ubuntu:ubuntu /home/ubuntu/.vagrant.d

echo
echo "Instalación de Vagrant con éxito"
echo "Debes cerrar esta terminal y volver a entrar para poder utilizar vagrant up"
echo

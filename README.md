# Instalación de Vagrant en Ubuntu 14.04

Utilizaremos el script vagrant_install.sh para instalar Vagrant, vagrant-kvm y 
vagrant-libvirt en la máquina.

Para utilizar el script de instalación de Vagrant haremos lo siguiente
en la máquina en la que lo queramos instalar:

**sudo apt-get install wget**

**wget git@gitlab.local.dart.technology:dart/infraestructura/vagrant_install.sh**

**sudo ./vagrant_install.sh**

Se está probando en las máquinas **clusterdocker1** y **clusterdocker2**.
La instalación se desarrolla con éxito.

Se continua haciendo pruebas debido a que aún no funciona la orden

**vagrant up --provider libvirt**

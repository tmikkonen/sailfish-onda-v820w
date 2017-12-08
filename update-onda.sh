#! /bin/bash

ssu re 2.0.5.6
ssu dr adaptation0            
ssu dr adaptation1
ssu ar http://sfos.scanf.su/onda-v820w-v3/ adaptation-onda
ssu ur

version --dup

# just to be sure these are not enabled
ssu dr adaptation0
ssu dr adaptation1

# remove old modules
rm -f /lib/modules/3.10.20/*.ko

# refresh
echo yes | zypper ref -f

# reinstall device-specific packages
zypper install -f -y droid-bin-tbj-onda-v820w-v3 droid-config-tbj-onda-v820w-v3 droid-config-tbj-onda-v820w-v3-flashing droid-config-tbj-onda-v820w-v3-kickstart-configuration droid-config-tbj-onda-v820w-v3-patterns droid-config-tbj-onda-v820w-v3-policy-settings droid-config-tbj-onda-v820w-v3-preinit-plugin droid-config-tbj-onda-v820w-v3-pulseaudio-settings droid-config-tbj-onda-v820w-v3-sailfish droid-config-tbj-onda-v820w-v3-ssu-kickstarts droid-hal-tbj-onda-v820w-v3 droid-hal-tbj-onda-v820w-v3-detritus droid-hal-tbj-onda-v820w-v3-kernel  droid-hal-tbj-onda-v820w-v3-kernel-modules droid-hal-tbj-onda-v820w-v3-tools

depmod -a

# check if you have graphics group and nemo is a member of it and reboot
if grep --quiet graphics:x:1003:nemo /etc/group; then
  reboot
# if graphics group is wrong for some reason, reinstall droid-hal-tbj-onda-v820w-v3
else
  zypper install -f -y droid-hal-tbj-onda-v820w-v3
  reboot
fi

#! /bin/bash

# enable needed repos
ssu er adaptation0
ssu er adaptation1

# make sure Jolla Tablet packages are installed
echo 1 | zypper in pattern:jolla-configuration-tbj pattern:jolla-hw-adaptation-tbj

# temporary add compat repo
ssu ar tmp-compat-v820w http://repo.merproject.org/obs/home:/TheKit:/compat-v820w/sailfish_latest_i486/
ssu ur

# refresh packages and install
sleep 10
echo y | zypper ref tmp-compat-v820w
echo 2 | zypper in pattern:droid-compat-v820w

# remove compat repo (provided now by droid-compat-droid-config package)
ssu rr tmp-compat-v820w

# upgrade SailfishOS
ssu re 2.2.0.29
version --dup
reboot

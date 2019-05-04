## sailfish-onda-v820w
Install & update Sailfish OS on Onda V820W V3/V5 tablets.

Credit for the Onda V820W Sailfish port and original update instructions goes to TheKit.  
See [talk.maemo.org](http://talk.maemo.org/showthread.php?t=96708). Thanks to everyone contributing to the thread!

The update script was created on Onda V820W V5 but should work also on V3. Currently the main(/only?) difference between the two tablets is the missing sound on V5.

### Install

* Format a FAT32 USB drive using label _USB_
* Download the [automatic installer image](https://mega.nz/#!8FZRiBwB!FBBD8CUMaBMkKcyiUDlw_sKfCjNZOQp713VqT-FoAhM) by TheKit
* Unpack the downloaded zip file to the root of the USB drive
* Comment out the line `set lang=ru_RU` in _/EFI/BOOT/grub.cfg_, so it looks like `# set lang=ru_RU`
* Boot the tablet from the USB drive (use a powered hub with keyboard + mouse, press ESC during boot, select Boot Manager and then the USB stick)

### Upgrade to 2.0.5.6

* After the first boot, skip the Sailfish Tutorial by tapping screen corners clockwise starting from the top left
* Connect to the Internet, create new/use existing Jolla Account, enable _Developer mode_ and allow _Untrusted software_ in Settings
* Start Terminal
* `devel-su`, enter password
* get script `curl -O https://raw.githubusercontent.com/tmikkonen/sailfish-onda-v820w/master/update-onda.sh`
* make sure it is executable `chmod u+x upgrade-2.0.5.6.sh`
* run script `./upgrade-2.0.5.6.sh`

### Upgrade to 2.2.0.29
(from 2.0.5.6)
* Start Terminal
* `devel-su`, enter password
* get script `curl -O https://raw.githubusercontent.com/tmikkonen/sailfish-onda-v820w/master/upgrade-2.2.0.29.sh`
* make sure it is executable `chmod u+x upgrade-2.2.0.29.sh`
* run script `./upgrade-2.2.0.29.sh`

### Upgrade through the [stop releases](https://jolla.zendesk.com/hc/en-us/articles/201836347#4)
* Start Terminal
* `devel-su`, enter password

. . .

`ssu re 3.0.0.8
version --dup
reboot`

. . .

`ssu re 3.0.2.8
version --dup
reboot`

### Notes
* If charging while upgrading, plug in the cable only after every boot & make sure to select _Charging Only_

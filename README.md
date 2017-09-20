## sailfish-onda-v820w
Install & update Sailfish OS on Onda V820W V3/V5 tablets.

All credit for the Onda V820W Sailfish port and original update instructions goes to TheKit.  
See [talk.maemo.org](http://talk.maemo.org/showthread.php?t=96708)

The update script was created on Onda V820W V5 but should work also on V3. Currently the main(/only?) difference between the two tablets is the missing sound on V5.

### Install

* Format a FAT32 USB drive using label _USB_
* Download the [automatic installer image](https://mega.nz/#!8FZRiBwB!FBBD8CUMaBMkKcyiUDlw_sKfCjNZOQp713VqT-FoAhM) by TheKit.
* Unpack the downloaded zip file to the root of the USB drive
* Comment out the line `set lang=ru_RU` in /EFI/BOOT/grub.cfg, so it looks like `# set lang=ru_RU`
* Boot the tablet from the USB drive (use a powered hub with keyboard + mouse, press ESC during boot, select Boot Manager and then the USB stick)

### Update

* After first boot, skip the Sailfish Tutorial by tapping screen corners clockwise starting from the top left
* Connect to the Internet, create new/use existing Jolla Account, enable Developer Mode and allow Untrusted sources
* Start Terminal
* `devel-su`, enter password
* get script `curl -o update-onda.sh --url https://raw.githubusercontent.com/tmikkonen/sailfish-onda-v820w/master/update-onda.sh`
* make sure it is executable `chmod u+x update-onda.sh`
* run script `./update-onda.sh`

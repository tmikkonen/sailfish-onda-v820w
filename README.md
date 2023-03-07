## sailfish-onda-v820w
Install & upgrade Sailfish OS on Onda V820W V3/V5 tablets.

Credit for the Onda V820W Sailfish port and original upgrade instructions goes to TheKit.  
See [talk.maemo.org](http://talk.maemo.org/showthread.php?t=96708). Thanks to everyone contributing to the thread!

The scripts were created on Onda V820W V5 but should work also on V3. Currently the main(/only?) difference between the two tablets is the missing sound on V5.

### Install

* Format a FAT32 USB drive using label _USB_
* Download the [automatic installer image](https://mega.nz/#!8FZRiBwB!FBBD8CUMaBMkKcyiUDlw_sKfCjNZOQp713VqT-FoAhM) by TheKit
* Unpack the downloaded zip file to the root of the USB drive
* Comment out the line `set lang=ru_RU` in _/EFI/BOOT/grub.cfg_, so it looks like `# set lang=ru_RU`
* Boot the tablet from the USB drive (use a powered hub with keyboard + mouse, press ESC during boot, select Boot Manager and then the USB stick)

### Upgrade to 2.0.5.6

* After the first boot, select language, accept the End User Licence, skip Time Setting, skip Connect to the Internet and bypass the Sailfish Tutorial by tapping screen corners clockwise starting from the top left
* The USB stick isn't needed anymore. Now would be a good time to set the tablet to recharge if it isn't already
* Enable _Developer mode_ and allow _Untrusted software_ in Settings
* Disable _Adjust automatically_ for brightness & set _Keep the display on while charging_ in Display settings
* Add a _Jolla Account_ and Turn on WLAN & connect to the Internet when prompted
* Create new/use existing credentials (speed up the process by unselecting & skipping any installations at this time)
* Switch the Sailfish OS update check from _Automatic_ to _Manual_
* Start the Terminal: `devel-su`, enter password
  get script `curl -O https://raw.githubusercontent.com/tmikkonen/sailfish-onda-v820w/master/upgrade-2.0.5.6.sh`  
  make sure it is executable `chmod u+x upgrade-2.0.5.6.sh`  
  run script `./upgrade-2.0.5.6.sh`

### Upgrade to 2.2.0.29
(from 2.0.5.6)
* Start the Terminal: `devel-su`, enter password  
  get script `curl -O https://raw.githubusercontent.com/tmikkonen/sailfish-onda-v820w/master/upgrade-2.2.0.29.sh`  
  make sure it is executable `chmod u+x upgrade-2.2.0.29.sh`  
  run script `./upgrade-2.2.0.29.sh`  
The script probably presents you with choices as solutions to problems.  
To the first number choice answer with `1` to deinstall packages and then `y`,  
to the second number choice answer with `2` to break pattern and then `y`.
* After reboot manually fix missing packages 
```
pkcon refresh
pkcon install jolla-keyboard-layout-all jolla-settings-system-sideloading
```
or try zypper

```
zypper ref -f
zypper in jolla-keyboard-layout-all jolla-settings-system-sideloading
```

### Upgrade to Sailfish 3
* `devel-su`, enter password
```
ssu re 3.0.0.8
version --dup
reboot
```
From now on it should be possible to upgrade quite easily e.g. 

```
ssu re 3.2.0.12
version --dup
reboot
```
GUI updates seem to be also possible based on a succesceful test upgrade but take this with a grain of salt, though.  

The Sailfish OS update check can now be turned back to _Automatic_, if preferred.

Check the device settings and adjust to your liking. Open the Jolla Store and install the apps you like. Also check out [OpenRepos](https://openrepos.net/content/basil/about-openrepos).

## Notes
* 2.2.0.29, 3.0.0.8, 3.2.0.12 are [stop releases](https://docs.sailfishos.org/Support/Releases/) that must be upgraded in succession - others will probably exist in the future, see the [here](https://docs.sailfishos.org/Support/Help_Articles/Updating_Sailfish_OS/) for details.
* When/If the SFOS upgrade fails see [this](https://docs.sailfishos.org/Support/Help_Articles/Updating_Sailfish_OS/#what-if-installing-an-os-update-fails-but-download-worked) for help. Doing the cleanups, setting the release back to the current version and running `pkcon refresh`, `pkcon update` & `reboot` and re-running the upgrade is worth trying. 

## Known Issues
On a tablet other than V3 upgrading past SFOS 3.3.0.16 will most likely [result booting to a blank screen](https://talk.maemo.org/showpost.php?p=1574126&postcount=265). You have been warned!

Connecting to the WLAN can be cranky but should get better once you update to at least 2.2.0.29.
The best results were (while WLAN off) first at adding the Jolla Account and afterwards trying to connect to the Jolla Store and following the WLAN prompts. YMMV.

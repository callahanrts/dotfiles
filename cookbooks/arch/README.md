# arch

TODO: Enter the cookbook description here.


Install Notes (Manjaro i3)

1. Weird flickering with wifi (also enables 5ghz)
  - Install linux headers (check uname -r for kernel version)
  - Install `broadcom-wl-dkms`
  - Run sudo mdoprobe wl

2. Turn Caps lock into control using ~/.Xmodmap
```
clear lock
clear control
keycode 66 = Control_L
add control = Control_L Control_R
```

3. Change key repeat. Add this to i3 config or something
```
exec --no-startup-id xset r rate 185 100
```
4. Figure out how to fine tune the touchpad

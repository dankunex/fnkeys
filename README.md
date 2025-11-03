# FnKeys

Fix function keys on TKL and compact keyboards under Linux. These will stop working as media control keys as expected.

TESTED DISTROS:
- Fedora 38/39/40/41/42/43*
- Debian 11/12/13
- Ubuntu 22.04/24.04/25.04/25.10
- Linux Mint 21.x/22.x
- OpenSUSE Tumbleweed
- Arch Linux

TESTED KEYBOARDS
- Newskill Serike V2 TKL

*Fedora 42 and later require FnKeys V2 or newer.

**If your distro doesn't use systemd, FnKeys may not work at all.**
**I haven't tested that.**

## Installation
1. [Download FnKeys](https://github.com/ivandfx/fnkeys/releases)

2. After downloading, go to the folder where FnKeys is located and open a terminal window.

3. Then, copy & paste this:

```
sudo chmod +x FnKeysFix.sh && ./FnKeysFix.sh
```

And you're done!

FnKeys is a pretty simple script, but for some people it can be a life saver to easily fix the function keys :)


Under a GPLv3 license.

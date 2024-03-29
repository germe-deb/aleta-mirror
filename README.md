<!--
SPDX-FileCopyrightText: 2022 debgerme <fossgerme@tuta.io>

SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Aleta Postre 

![REUSE compliant](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre/raw/branch/master/other/images/reuse-compliant.svg) 

### A fancy icon pack with a very very consistent look!

![aleta](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre/raw/branch/master/other/images/Presentacion.png)

This icon pack is strongly inspired in moka and ameixa, and a bit in adwaita.

I am working just now adding more icons and updating all the old-designed ones. In a few months (or weeks) the final release will be here in the [releases page](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre/releases)! 

# Download

* [from a release](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre/releases)
* [build from source](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre#build-from-source)
* [from an automatic release*](https://gitea.sergiotarxz.freemyip.com/sergiotarxz/AletaReleaser)

# build from source

Please see the help command in the script. it is the most updated way to see how to export aleta.

### Dependencies

Make sure you have them all installed.
| dependency   | status   |
| ------------ | -------- |
| inkscape     | required |
| GNU parallel | required |
| bash         | required |
| optipng      | optional |

optipng is optional, only required if you want to optimize your build. useful while distributing it.

Before building, please pull all the changes (`git pull`). I update aleta a lot and if you miss a change, it will be unpleasant for me ewe

### build command:

```
# Clone this repo and enter to it
git clone https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre
cd aleta-postre

# Launch the build script with the following options:
# autoinstall, restart, export
# note: the building process takes more or less 15 minutes*

./tasks/build.sh -r -i -e
```

* apply

	go to your settings app and select aleta as the icon pack

## Credits

[Credits list](./AUTHORS.md)	

## license

*Copyright: 2022 debgerme <fossgerme@tuta.io>*

This project is REUSE 3.0 compliant :D

* The scripts in this project are licensed under the GPLv3 or later license
* The images in this project are licensed under the CC-BY-SA-4.0 license
* The gitignore is licensed under the Unlicense license

the licenses are in the LICENSES folder. 

![gpl image](https://www.gnu.org/graphics/gplv3-with-text-136x68.png) ![CC-BY-SA-4.0](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

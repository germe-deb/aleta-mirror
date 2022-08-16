# Aleta Postre 

### A fancy icon pack with a very very consistent look!

![aleta](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre/raw/branch/master/other/images/Presentacion.png)

This icon pack is strongly inspired in moka and ameixa, and a bit in adwaita.

I am working just now adding more icons and updating all the old-designed ones. In a few months (or weeks) the final release will be here in the [releases page](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre/releases)! 

# Download

* [from a release](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre/releases)
* [build from source](https://gitea.sergiotarxz.freemyip.com/germedeb/aleta-postre#build-from-source)
* [from an automatic release*](https://gitea.sergiotarxz.freemyip.com/sergiotarxz/AletaReleaser)

# build from source

### Dependencies

Make sure you have them all installed.

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
# autoinstall, optimize, restart, export

./tasks/build.sh iore
```
*note: the building process takes more or less 15 minutes*

* apply

	go to your settings app and select aleta as the icon pack

## Credits

[Credits list](./AUTHORS.md)	

## license

the scripts on this project are licensed under the GNU GPL v3. See LICENSE
	that license is also known as GPLv3

![gpl image](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)

the assets in this work are licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. See LICENSE
	that license is also known as CC-BY-SA-4.0

![CC-BY-SA-4.0](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

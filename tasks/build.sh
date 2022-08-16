#!/bin/bash

# define the colors
info_color="\e[1;34m"   # tasks color
comple_color="\e[1;32m" # Ok color
reset_colors="\e[0m"    # this resets the coloring


# Check dependencies
# If you are having trobule with a dependency that IS in your system but
# the script can't continue, please add this to your command: --ignore-dependency-check
case "$@" in *--ignore-dependency-check*)
IGNOREDEPS=ok
esac
# this checks for that option and if it is ok, skip this process
if [ "$IGNOREDEPS" != ok ]
then
# It mutes the output but verifies if the command returns an error
# if that's true, then the process can't continue
command -v inkscape >/dev/null 2>&1 || { echo >&2 "Missing dependency: inkscape"; DEPSCOMPLETE=n; }
command -v parallel >/dev/null 2>&1 || { echo >&2 "Missing dependency: parallel"; DEPSCOMPLETE=n; }
command -v bash     >/dev/null 2>&1 || { echo >&2 "Missing dependency: bash";     DEPSCOMPLETE=n; }
fi

# Check for --help
# This is the help message
case "$@" in *--help*|*-h*)
	printf "${info_color}Aleta's build script help${reset_colors}\\n\
Usage: ./tasks/build.sh [args]...

${info_color}Examples:${reset_colors}
  ./tasks/build.sh ra     Start the build from cero, don't launch optipng
  ./tasks/build.sh rai    Same but now it autoinstalls
  ./tasks/build.sh        Continue building. useful if you cancelled the build

${info_color}Arguments:${reset_colors}
  h  -h  --help  help       Show this help.
  a  avoid-optipng          Don't launch optipng process
  r  from-cero  restart     Copy the SVG again and start the build again
  i  autoinstall            Autoinstall to User directory

This software is licensed under the GPLv3 and the CC-BY-SA 4.0 licenses.
See README and LICENSE for more information\\n"
	exit 0;
esac

# here is the checking. it is sepparated for practicy
if [ "$DEPSCOMPLETE" = n ]
then
	echo Please install the missing dependencies to start building
	exit 1
fi

# begin exportation and stuff
printf "${info_color}This script runs the build tasks and performs an install (or an update) of aleta to your home${reset_colors}\\n\\n"

case "$@" in *r*|*restart*|*from-cero*)
	RESTART=yes
esac

if [ "$RESTART" = yes ]

# this deletes the build directory
then printf "${info_color}cleaning up the build directory...${reset_colors}\\n"
rm _build/aleta -rf

# this creates the folder structure used in the build and while the building
printf "${info_color}rebuilding folder structure...${reset_colors}\\n"
./tasks/rebuildfolders.sh

# this copies the "SVG in" to the build folders 
printf "${info_color}copying the files to build in the build dir${reset_colors}\\n"
cp icons/apps/*.svg        _build/icons-t/apps/
cp icons/places/*.svg      _build/icons-t/places/
cp icons/categories/*.svg  _build/icons-t/categories/
cp icons/devices/*.svg     _build/icons-t/devices/
cp icons/status/*.svg      _build/icons-t/status/
cp icons/mimetypes/*.svg   _build/icons-t/mimetypes/
cp icons/actions/*.svg     _build/icons-t/actions/
cp icons/animations/*.svg  _build/icons-t/animations/

fi


printf "${info_color}exporting all the icons... this will take a long time.${reset_colors}\\n"
./tasks/export/export-places.sh 
./tasks/export/export-apps.sh
./tasks/export/export-categories.sh
./tasks/export/export-devices.sh
./tasks/export/export-status.sh
./tasks/export/export-mimetypes.sh
./tasks/export/export-actions.sh
./tasks/export/export-animations.sh

case "$@" in *avoid-optipng*|*a*)
	OPTIPNG=avoid
esac

if [ "$OPTIPNG" != avoid ];
      then 
      command -v optipng  >/dev/null 2>&1 || { echo >&2 "Missing dependency: optipng"; DEPSCOMPLETE=n; }
      if [ "$DEPSCOMPLETE" = n ] ; then
  	      echo Please install the missing dependencies to start building
  	      exit 1
      fi
      printf "${info_color}Using optipng to reduce the size of the build...${reset_colors}\\n"
      ./tasks/opticall.sh
fi

printf "${info_color}Launching misc commands...${reset_colors}\\n"
./tasks/misc.sh

printf "${info_color}starting link process...${reset_colors}\\n"
./tasks/linkcall.sh

case "$@" in *autoinstall*|*i*)
	printf "${info_color}Performing an Update/Installation of aleta${reset_colors}\\n"
	rm -rf ~/.icons/aleta
	mkdir ~/.icons/aleta -p
	cp -r ./_build/aleta/* ~/.icons/aleta/
	printf "${info_color}Updating gtk icon cache...${reset_colors}\\n"
	gtk-update-icon-cache ~/.icons/aleta/
	
esac

printf "${comple_color}\\nCOMPLETED! The icon pack is builded.${reset_colors}\\n"

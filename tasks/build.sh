#!/bin/bash

# SPDX-FileCopyrightText: 2022 debgerme <fossgerme@tuta.io>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# define the colors
info_color="\e[1;34m"   # tasks color
comple_color="\e[1;32m" # Ok color
reset_colors="\e[0m"    # this resets the coloring


# Check dependencies
# If you are having trobule with a dependency that IS in your system but
# the script can't continue, please add this to your command: --ignore-dependency-check
case "$@" in *-k*|*--ignore-deps*)
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
case "$@" in *-h*|*help*)
	printf "${info_color}Aleta's build script help${reset_colors}\\n\
Usage: ./tasks/build.sh [args]...

${info_color}Examples:${reset_colors}
  ./tasks/build.sh -r -e       Start the build from cero
  ./tasks/build.sh -r -e -i    Same but now it autoinstalls
  ./tasks/build.sh -o -e -r    Same as the first one but now launch optipng
  ./tasks/build.sh -e          Continue building. useful if you cancelled the build

${info_color}Arguments:${reset_colors}
  -h  --help    help        Show this help.
  -e  --export              Export the remaining icons
  -o  --use-optipng         Launch optipng process
  -v  --verbose             Show more info. useful for debugging (NIY)
  -r  --from-cero           Copy the SVG again and start the build again
  -i  --autoinstall         Autoinstall to User directory
  -k  --ignore-deps         Don't check for dependencies.

NIY means Not Implemented Yet

This software is licensed under the GPLv3 and the CC-BY-SA 4.0 licenses.
See README and LICENSE for more information\\n"
	exit 0;
esac

# check if you written verbose and set that variable
case "$@" in *-v*|*--verbose*)
VERBOSE=yes
esac

# here is the checking. it is sepparated for practicy
if [ "$DEPSCOMPLETE" = n ]
then
	echo Please install the missing dependencies to start building
	exit 1
fi

# begin exportation and stuff
printf "${info_color}This script runs the build tasks and performs an install (or an update) of aleta to your home${reset_colors}\\n\\n"

# check if there is a valid option, if it is, continue. if not, mark the variable NOTOPTIONS and stop the process
case "$@" in *-e*|*--export*|*-h*|*--help*|*help*|*-r*|*--from-cero*|*-o*|*--use-optipng*|*-i*|*--autoinstall*)
	NOTOPTIONS=thereis
esac

if [ "$NOTOPTIONS" != thereis ] ; then
      printf "please add arguments.
type ${comple_color}./tasks/build.sh${reset_colors} --help to see all the arguments available
ERROR: there is no options, exit.\\n"
      exit 1
fi

case "$@" in *-r*|*--from-cero*)
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
cp icons/emblems/*.svg     _build/icons-t/emblems/

cp icons/apps-symbolic/*.svg        _build/icons-t/apps-symbolic/
cp icons/places-symbolic/*.svg      _build/icons-t/places-symbolic/
cp icons/categories-symbolic/*.svg  _build/icons-t/categories-symbolic/
cp icons/devices-symbolic/*.svg     _build/icons-t/devices-symbolic/
cp icons/status-symbolic/*.svg      _build/icons-t/status-symbolic/
cp icons/mimetypes-symbolic/*.svg   _build/icons-t/mimetypes-symbolic/
cp icons/actions-symbolic/*.svg     _build/icons-t/actions-symbolic/
cp icons/animations-symbolic/*.svg  _build/icons-t/animations-symbolic/
cp icons/emblems-symbolic/*.svg     _build/icons-t/emblems-symbolic/

fi

# Check if you written the export option 
case "$@" in *-e*|*--export*)
      # I dont want to conflict with the export command XD
	EXPOR=yes
esac

if [ "$EXPOR" = yes ]; then
      printf "${info_color}exporting all the icons... this will take a long time.${reset_colors}\\n"
      ./tasks/runexport.sh
fi

case "$@" in *--use-optipng*|*-o*)
	OPTIPNG=use
esac

if [ "$OPTIPNG" = use ]; then
      if [ "$IGNOREDEPS" != ok ]; then 
            command -v optipng  >/dev/null 2>&1 || { echo >&2 "Missing dependency: optipng"; DEPSCOMPLETE=n; }
            if [ "$DEPSCOMPLETE" = n ]; then
  	            echo To optimize the build, please install optipng
  	            exit 1
            fi
      fi
      printf "${info_color}Using optipng to reduce the size of the build...${reset_colors}\\n"
      ./tasks/opticall.sh
fi

# copy the index.theme file to the build. necesary to interpretate the icon pack in the settings
cp other/index.theme _build/aleta/ && printf "${info_color}copied index.theme to the build${reset_colors}\\n"

printf "${info_color}starting link process...${reset_colors}\\n"
if [ "$VERBOSE" = yes ] ; then
      ./tasks/runlink.sh
else
      ./tasks/runlink.sh >/dev/null 2>&1
fi
case "$@" in *--autoinstall*|*-i*)
	printf "${info_color}Performing an Update/Installation of aleta${reset_colors}\\n"
	
      cp -r ./_build/aleta ~/.icons/tmpaleta
      rm -rf ~/.icons/aleta
      mv ~/.icons/tmpaleta ~/.icons/aleta
	printf "${info_color}Updating gtk icon cache...${reset_colors}\\n"
	gtk-update-icon-cache ~/.icons/aleta/
	
esac

printf "${comple_color}\\nCOMPLETED! The icon pack is builded.${reset_colors}\\n"

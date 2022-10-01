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
  -v  --verbose             Show more info. useful for debugging
  -r  --from-cero           Copy the SVG again and start the build again
  -i  --autoinstall         Autoinstall to User directory
  -k  --ignore-deps         Don't check for dependencies.

This software is licensed under the GPLv3 and the CC-BY-SA 4.0 licenses.
See README and LICENSE for more information\\n"
	exit 0;
esac

# check if you written verbose and set that variable
case "$@" in *-v*|*--verbose*)
VERBOSE=yes
esac

# here is the checking. it is sepparated for practicy
if [ "$DEPSCOMPLETE" = n ]; then
	echo Please install the missing dependencies to start building
	exit 1
fi

# begin exportation and stuff
printf "${info_color}This script runs the build tasks and performs an install (or an update) of aleta to your home${reset_colors}\\n\\n"

# check if there is a valid option, if it is, continue. if not, mark the variable NOTOPTIONS and stop the process
case "$@" in *-e*|*--export*|*-h*|*--help*|*help*|*-r*|*--from-cero*|*-o*|*--use-optipng*|*-i*|*--autoinstall*)
	NOTOPTIONS=thereis
esac

# if there is no options, say that and stop with an error
if [ "$NOTOPTIONS" != thereis ]; then
      printf "please add at least one argument. (-k does not count.)
type ${comple_color}./tasks/build.sh --help${reset_colors} to see all the arguments available
ERROR: there is no options, exit.\\n"
      exit 1
fi

case "$@" in *-r*|*--from-cero*)
	RESTART=yes
	if [ "$VERBOSE" = yes ] ; then
            printf "${info_color}Detected \"restart\" option, this will remove the last build and start agin...${reset_colors}\\n"
      fi
esac

if [ "$RESTART" = yes ]; then

      # this deletes the build directory
      printf "${info_color}cleaning up the build directory...${reset_colors}\\n"
      rm _build/aleta -rf

      # this creates the folder structure used in the build and while the building
      printf "${info_color}rebuilding folder structure...${reset_colors}\\n"
      ./tasks/rebuildfolders.sh

      # this copies the "SVG in" to the build folders 
      printf "${info_color}copying the files to build in the build dir${reset_colors}\\n"
      if [ "$VERBOSE" = yes ] ; then
            ./tasks/copysvg.sh
      else
            ./tasks/copysvg.sh >/dev/null 2>&1
      fi
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
  	            exit 2
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
	
	printf "${info_color}Note that the route of the autoinstall has changed from ${reset_colors}~/.icons/aleta${info_color} to ${reset_colors}~/.local/share/icons/aleta\\n"

	# checks if the install route is there, if not, creates it.
      if [ ! -d ~/.local/share/icons/ ] ; then
            mkdir ~/.local/
            mkdir ~/.local/share/
            mkdir ~/.local/share/icons/
      fi

      # this makes a copy before removing the installation. this reduces significantly the time without an installation.
      cp -r ./_build/aleta _build/tmpaleta

      # this two IFs checks if there is an old installation of aleta and then removes them
      if [ -d ~/.icons/aleta ] ; then
            rm -rf ~/.icons/aleta
            PREVIOUSLYINSTALLED=yes
      fi
      if [ -d ~/.local/share/icons/aleta ] ; then
            rm -rf ~/.local/share/icons/aleta
            PREVIOUSLYINSTALLED=yes
      fi

      # if there was a previous installation of aleta, say Updating instead of Installing
      if [ "$PREVIOUSLYINSTALLED" = yes ]; then
            printf "${info_color}Updating aleta icon pack${reset_colors}\\n"
      else
            printf "${info_color}Installing aleta icon pack${reset_colors}\\n"
      fi

      # moves the copy to the actual destination.
      mv _build/tmpaleta ~/.local/share/icons/aleta

      # updates the icon cache
	printf "${info_color}Updating gtk icon cache...${reset_colors}\\n"
      if [ "$VERBOSE" = yes ] ; then
	      gtk-update-icon-cache ~/.local/share/icons/aleta
      else
	      gtk-update-icon-cache ~/.local/share/icons/aleta >/dev/null 2>&1
      fi
	
esac

printf "${comple_color}\\nCOMPLETED! The icon pack is builded.${reset_colors}\\n"

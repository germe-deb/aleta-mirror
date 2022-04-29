#!/bin/bash

info_color="\e[1;34m"   # tasks color
comple_color="\e[1;32m" # Ok color
reset_colors="\e[0m"    # this resets the coloring

command -v inkscape >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'inkscape'"; exit 1; }
command -v parallel >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'parallel'"; exit 1; }
command -v bash >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'bash'"; exit 1; }

printf "${info_color}this script build the icon pack and update/installs it to your home directory${reset_colors}\\n\\n"

printf "${info_color}cleaning up the build directory...${reset_colors}\\n"
rm _build/aleta -rf

printf "${info_color}rebuilding folder structure...${reset_colors}\\n"
./tasks/rebuildfolders.sh

printf "${info_color}copying the files to build in the build dir${reset_colors}\\n"

cp icons/apps/*.svg        _build/icons-t/apps/
cp icons/places/*.svg      _build/icons-t/places/
cp icons/categories/*.svg  _build/icons-t/categories/
cp icons/devices/*.svg     _build/icons-t/devices/
cp icons/status/*.svg      _build/icons-t/status/
cp icons/mimetypes/*.svg   _build/icons-t/mimetypes/
cp icons/actions/*.svg     _build/icons-t/actions/
cp icons/animations/*.svg  _build/icons-t/animations/

printf "${info_color}starting link process...${reset_colors}\\n"
./tasks/linkcall.sh

printf "${info_color}exporting all the icons... This will take a long time; and depends directly on the numbers of cores your processor has.${reset_colors}\\n"
./tasks/export/export-places.sh 
./tasks/export/export-apps.sh
./tasks/export/export-categories.sh
./tasks/export/export-devices.sh
./tasks/export/export-status.sh
./tasks/export/export-mimetypes.sh
./tasks/export/export-actions.sh
./tasks/export/export-animations.sh

printf "${info_color}Launching misc commands...${reset_colors}\\n"
./tasks/misc.sh
./tasks/mvscalable.sh

printf "${info_color}Performing an Update/Installation of aleta${reset_colors}\\n"
rm -rf ~/.icons/aleta
mkdir ~/.icons/aleta -p
cp -r ./_build/aleta/* ~/.icons/aleta/

printf "${info_color}Updating gtk icon cache...${reset_colors}\\n"

gtk-update-icon-cache ~/.icons/aleta/

printf "${comple_color}\\nCOMPLETED\!${reset_colors}\\n"

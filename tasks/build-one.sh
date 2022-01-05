#!/bin/bash

info_color="\e[1;34m"   # tasks color
comple_color="\e[1;32m" # Ok color
reset_colors="\e[0m"    # this resets the coloring

command -v inkscape >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'inkscape'"; exit 1; }
command -v scour >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'scour'"; exit 1; }
command -v parallel >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'parallel'"; exit 1; }


printf "${info_color}this scripts deletes the icon pack, and rebuild it again${reset_colors}\\n\\n"
printf "${info_color}moving icons from icons to todo...${reset_colors}\\n"
mv -u icons/apps/*.svg todo/apps/
mv -u icons/places/*.svg todo/places/
mv -u icons/categories/*.svg todo/categories/
mv -u icons/devices/*.svg todo/devices/
mv -u icons/status/*.svg todo/status/
mv -u icons/mimetypes/*.svg todo/mimetypes/
mv -u icons/actions/*.svg todo/actions/
mv -u icons/actions-sym/*.svg todo/actions-sym/
mv -u icons/animations/*.svg todo/animations/

printf "${info_color}removing last build...${reset_colors}\\n"
rm aleta -rf 

printf "${info_color}rebuilding folders...${reset_colors}\\n"
./tasks/rebuildfolders.sh

printf "${info_color}copying the index.theme...${reset_colors}\\n"
cp other/index.theme aleta/index.theme

printf "${info_color}starting link process...${reset_colors}\\n"
./tasks/linkcall.sh &

printf "${info_color}exporting all the icons...${reset_colors}\\n"
./tasks/oldexport/export-places.sh
./tasks/oldexport/export-apps.sh
./tasks/oldexport/export-categories.sh
./tasks/oldexport/export-devices.sh
./tasks/oldexport/export-status.sh
./tasks/oldexport/export-mimetypes.sh
./tasks/oldexport/export-actions.sh
./tasks/oldexport/export-sym-actions.sh
./tasks/oldexport/export-animations.sh

printf "${info_color}Launching misc commands${reset_colors}\\n"
./tasks/misc.sh

printf "${info_color}Installing/Updating the install of aleta${reset_colors}\\n"
rm -r ~/.icons/aleta
mv aleta ~/.icons/aleta

printf "${comple_color}\\nF i n i s h e d${reset_colors}\\n"
printf "${info_color}I hope you like my icon pack!${reset_colors}\\n"

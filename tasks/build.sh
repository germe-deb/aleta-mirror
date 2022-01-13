#!/bin/bash

info_color="\e[1;34m"   # tasks color
comple_color="\e[1;32m" # Ok color
reset_colors="\e[0m"    # this resets the coloring

command -v inkscape >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'inkscape'"; exit 1; }
command -v scour >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'scour'"; exit 1; }
command -v parallel >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'parallel'"; exit 1; }


printf "${info_color}this scripts deletes the icon pack, and rebuild it again${reset_colors}\\n\\n"

printf "${info_color}removing last build...${reset_colors}\\n"
rm _build/aleta -rf

printf "${info_color}rebuilding folders...${reset_colors}\\n"
./tasks/rebuildfolders.sh

printf "${info_color}making a copy of the files to build${reset_colors}\\n"

cp icons/apps/*.svg        _build/icons-t/apps/
cp icons/places/*.svg      _build/icons-t/places/
cp icons/categories/*.svg  _build/icons-t/categories/
cp icons/devices/*.svg     _build/icons-t/devices/
cp icons/status/*.svg      _build/icons-t/status/
cp icons/mimetypes/*.svg   _build/icons-t/mimetypes/
cp icons/actions/*.svg     _build/icons-t/actions/
cp icons/actions-sym/*.svg _build/icons-t/actions-sym/
cp icons/animations/*.svg  _build/icons-t/animations/

printf "${info_color}starting link process...${reset_colors}\\n"
./tasks/linkcall.sh

printf "${info_color}exporting all the icons...${reset_colors}\\n"
./tasks/export/export-places.sh
./tasks/export/export-apps.sh
./tasks/export/export-categories.sh
./tasks/export/export-devices.sh
./tasks/export/export-status.sh
./tasks/export/export-mimetypes.sh
./tasks/export/export-actions.sh
./tasks/export/export-sym-actions.sh
./tasks/export/export-animations.sh

printf "${info_color}Launching misc commands${reset_colors}\\n"
./tasks/misc.sh

printf "${info_color}Installing/Updating the install of aleta${reset_colors}\\n"
rm -rf ~/.icons/aleta
mkdir ~/.icons/aleta -p
cp -r ./_build/aleta/* ~/.icons/aleta/

printf "${comple_color}\\ncompleted${reset_colors}\\n"

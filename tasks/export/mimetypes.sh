#! /bin/bash

# SPDX-FileCopyrightText: 2022 debgerme <fossgerme@tuta.io>
#
# SPDX-License-Identifier: GPL-3.0-or-later

for SVG in _build/icons-t/mimetypes/*.svg
do
	if [[ -f "${SVG}" ]]; then

            # this command removes the .svg extension in the file,
            # and then write it to the variable N
		N=$(basename ${SVG} .svg)

		# this runs the export operation in paralell.
		parallel ::: \
		"inkscape -w 8 -h 8 -o      _build/aleta/mimetypes/8/${N}.png    ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 16 -h 16 -o    _build/aleta/mimetypes/16/${N}.png   ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 22 -h 22 -o    _build/aleta/mimetypes/22/${N}.png   ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 24 -h 24 -o    _build/aleta/mimetypes/24/${N}.png   ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 32 -h 32 -o    _build/aleta/mimetypes/32/${N}.png   ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 48 -h 48 -o    _build/aleta/mimetypes/48/${N}.png   ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 64 -h 64 -o    _build/aleta/mimetypes/64/${N}.png   ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 96 -h 96 -o    _build/aleta/mimetypes/96/${N}.png   ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 128 -h 128 -o  _build/aleta/mimetypes/128/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 256 -h 256 -o  _build/aleta/mimetypes/256/${N}.png  ${SVG}  >/dev/null 2>&1" 

            # this moves the icon to the icons-e folder. this
            # means that the icon is exported and you don't
            # need to export it again
		mv ${SVG} _build/icons-e/mimetypes/

		# output to the terminal
		echo exported: ${SVG}
	fi
done

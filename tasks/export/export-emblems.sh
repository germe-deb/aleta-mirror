#! /bin/bash

# SPDX-FileCopyrightText: 2022 debgerme <fossgerme@tuta.io>
#
# SPDX-License-Identifier: GPL-3.0-or-later

for SVG in _build/icons-t/emblems/*.svg
do
	if [[ -f "${SVG}" ]]; then
		N=$(basename ${SVG} .svg)
		Nscalable=$(basename ${SVG} .symbolic.svg)
		
		parallel  ::: \
		"inkscape -w 8 -h 8 -o      _build/aleta/emblems/8/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 16 -h 16 -o    _build/aleta/emblems/16/${N}.png ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 24 -h 24 -o    _build/aleta/emblems/24/${N}.png ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 32 -h 32 -o    _build/aleta/emblems/32/${N}.png ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 48 -h 48 -o    _build/aleta/emblems/48/${N}.png ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 64 -h 64 -o    _build/aleta/emblems/64/${N}.png ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 96 -h 96 -o    _build/aleta/emblems/96/${N}.png ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 128 -h 128 -o  _build/aleta/emblems/128/${N}.png ${SVG} >/dev/null 2>&1" \
		"inkscape -w 256 -h 256 -o  _build/aleta/emblems/256/${N}.png ${SVG} >/dev/null 2>&1"
            cp ${SVG} _build/aleta/emblems/scalable/${Nscalable}.svg
		mv ${SVG} _build/icons-e/emblems/
		
		echo exported: ${SVG}
	fi
done

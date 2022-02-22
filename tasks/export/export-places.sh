#! /bin/bash

for SVG in _build/icons-t/places/*.svg
do
	if [[ -f "${SVG}" ]]; then
		N=$(basename ${SVG} .svg)

		echo exporting ${SVG}
		parallel ::: \
		"inkscape -w 8 -h 8 -o      _build/aleta/places/8/${N}.png   ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 16 -h 16 -o    _build/aleta/places/16/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 22 -h 22 -o    _build/aleta/places/22/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 24 -h 24 -o    _build/aleta/places/24/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 32 -h 32 -o    _build/aleta/places/32/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 48 -h 48 -o    _build/aleta/places/48/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 64 -h 64 -o    _build/aleta/places/64/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 96 -h 96 -o    _build/aleta/places/96/${N}.png  ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 128 -h 128 -o  _build/aleta/places/128/${N}.png ${SVG}  >/dev/null 2>&1" \
		"inkscape -w 256 -h 256 -o  _build/aleta/places/256/${N}.png ${SVG}  >/dev/null 2>&1" 

		mv ${SVG} _build/icons-e/places/
	fi
done

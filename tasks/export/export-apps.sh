#! /bin/bash

for SVG in _build/icons-t/apps/*.svg
do
	if [[ -f "${SVG}" ]]; then
		N=$(basename ${SVG} .svg)

		parallel ::: \
		"inkscape -w 8 -h 8 -o      _build/aleta/apps/8/${N}.png ${SVG}" \
		"inkscape -w 16 -h 16 -o    _build/aleta/apps/16/${N}.png ${SVG}" \
		"inkscape -w 22 -h 22 -o    _build/aleta/apps/22/${N}.png ${SVG}" \
		"inkscape -w 24 -h 24 -o    _build/aleta/apps/24/${N}.png ${SVG}" \
		"inkscape -w 32 -h 32 -o    _build/aleta/apps/32/${N}.png ${SVG}" \
		"inkscape -w 48 -h 48 -o    _build/aleta/apps/48/${N}.png ${SVG}" \
		"inkscape -w 64 -h 64 -o    _build/aleta/apps/64/${N}.png ${SVG}" \
		"inkscape -w 96 -h 96 -o    _build/aleta/apps/96/${N}.png ${SVG}" \
		"inkscape -w 128 -h 128 -o  _build/aleta/apps/128/${N}.png ${SVG}" \
		"inkscape -w 256 -h 256 -o  _build/aleta/apps/256/${N}.png ${SVG}" 

		mv ${SVG} _build/icons-e/apps/
	fi
done


#! /bin/bash

for SVG in _build/icons-t/actions-sym/*.svg
do
	if [[ -f "${SVG}" ]]; then
		N=$(basename ${SVG} .svg)

		parallel ::: \
		"inkscape -w 16 -h 16 -o    _build/aleta/actions-sym/16/${N}.png ${SVG}" \
		"inkscape -w 24 -h 24 -o    _build/aleta/actions-sym/24/${N}.png ${SVG}" \
		"inkscape -w 32 -h 32 -o    _build/aleta/actions-sym/32/${N}.png ${SVG}" \
		"inkscape -w 48 -h 48 -o    _build/aleta/actions-sym/48/${N}.png ${SVG}" \
		"inkscape -w 64 -h 64 -o    _build/aleta/actions-sym/64/${N}.png ${SVG}" \
		"inkscape -w 96 -h 96 -o    _build/aleta/actions-sym/96/${N}.png ${SVG}" \
		"inkscape -w 128 -h 128 -o  _build/aleta/actions-sym/128/${N}.png ${SVG}" \
		
		mv ${SVG} _build/icons-e/actions-sym/
	fi
done


#! /bin/bash

# Check dependencies
command -v inkscape >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'inkscape'"; exit 1; }
command -v scour >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'scour'"; exit 1; }

# export from todo/apps to folders, with the appropiated resolution
for SVG in todo/animations/*.svg
do
	if [[ -f "${SVG}" ]]; then
		N=$(basename ${SVG} .svg)
		parallel ::: \
		"inkscape -w 8 -h 8 -o aleta/apps/8/${N}.png ${SVG}" \
		"inkscape -w 16 -h 16 -o aleta/apps/16/${N}.png ${SVG}" \
		"inkscape -w 22 -h 22 -o aleta/apps/22/${N}.png ${SVG}" \
		"inkscape -w 24 -h 24 -o aleta/apps/24/${N}.png ${SVG}" \
		"inkscape -w 32 -h 32 -o aleta/apps/32/${N}.png ${SVG}" \
		"inkscape -w 48 -h 48 -o aleta/apps/48/${N}.png ${SVG}" \
		"inkscape -w 64 -h 64 -o aleta/apps/64/${N}.png ${SVG}" \
		"inkscape -w 96 -h 96 -o aleta/apps/96/${N}.png ${SVG}" \
		"inkscape -w 128 -h 128 -o aleta/apps/128/${N}.png ${SVG}" \
		"inkscape -w 256 -h 256 -o aleta/apps/256/${N}.png ${SVG}" 

		mv ${SVG} icons/apps
	fi
done


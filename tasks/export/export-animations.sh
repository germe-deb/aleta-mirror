#! /bin/bash

# Check dependencies
command -v inkscape >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'inkscape'"; exit 1; }
command -v scour >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'scour'"; exit 1; }

# export from todo/apps to folders, with the appropiated resolution
for SVG in todo/animations/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
	inkscape -w 8 -h 8 -e aleta/animations/8/${N}.png ${SVG}
        inkscape -w 16 -h 16 -e aleta/animations/16/${N}.png ${SVG}
        inkscape -w 22 -h 22 -e aleta/animations/22/${N}.png ${SVG}
        inkscape -w 24 -h 24 -e aleta/animations/24/${N}.png ${SVG}
        inkscape -w 32 -h 32 -e aleta/animations/32/${N}.png ${SVG} 
        inkscape -w 48 -h 48 -e aleta/animations/48/${N}.png ${SVG} 
        inkscape -w 64 -h 64 -e aleta/animations/64/${N}.png ${SVG} 
        inkscape -w 96 -h 96 -e aleta/animations/96/${N}.png ${SVG}
        inkscape -w 128 -h 128 -e aleta/animations/128/${N}.png ${SVG}
	inkscape -w 256 -h 256 -e aleta/animations/256/${N}.png ${SVG}

        mv ${SVG} icons/apps
    fi
done


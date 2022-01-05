#! /bin/bash

# export from todo/status to folders, with the appropiated resolution
for SVG in todo/status/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        inkscape -w 8 -h 8 -e aleta/status/8/${N}.png ${SVG} # in this folder are 8x8 PNGs
        inkscape -w 16 -h 16 -e aleta/status/16/${N}.png ${SVG} # in this folder are 16x16 PNGs
        inkscape -w 22 -h 22 -e aleta/status/22/${N}.png ${SVG} # in this folder are 22x22 PNGs
        inkscape -w 24 -h 24 -e aleta/status/24/${N}.png ${SVG} # ...
        inkscape -w 32 -h 32 -e aleta/status/32/${N}.png ${SVG}
        inkscape -w 48 -h 48 -e aleta/status/48/${N}.png ${SVG}
        inkscape -w 64 -h 64 -e aleta/status/64/${N}.png ${SVG}
        inkscape -w 96 -h 96 -e aleta/status/96/${N}.png ${SVG}
        inkscape -w 128 -h 128 -e aleta/status/128/${N}.png ${SVG}
        inkscape -w 256 -h 256 -e aleta/status/256/${N}.png ${SVG}

        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp # optimize PNGs
                                                                                                 
        mv ${SVG} icons/status/ &
    fi
done



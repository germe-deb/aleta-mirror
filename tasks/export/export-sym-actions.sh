#! /bin/bash

# Check dependencies
command -v inkscape >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'inkscape'"; exit 1; }
command -v scour >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'scour'"; exit 1; }


for SVG in todo/actions-sym/*.svg
do
	if [[ -f "${SVG}" ]]; then
		N=$(basename ${SVG} .svg)
		inkscape -w 16 -h 16 -e aleta/actions/16/${N}.png ${SVG}
		inkscape -w 24 -h 24 -e aleta/actions/24/${N}.png ${SVG}
		inkscape -w 32 -h 32 -e aleta/actions/32/${N}.png ${SVG}
		inkscape -w 48 -h 48 -e aleta/actions/48/${N}.png ${SVG}

		cp ${SVG} ${SVG}.tmp
		scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
		rm ${SVG}.tmp
		mv ${SVG} icons/actions-sym
	fi
done

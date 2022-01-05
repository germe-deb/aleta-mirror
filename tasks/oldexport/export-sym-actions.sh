#! /bin/bash

for SVG in todo/actions-sym/*.svg
do
	if [[ -f "${SVG}" ]]; then
		N=$(basename ${SVG} .svg)
		parallel ::: \
		"inkscape -w 16 -h 16 -o aleta/actions/16/${N}.png ${SVG}" \
		"inkscape -w 24 -h 24 -o aleta/actions/24/${N}.png ${SVG}" \
		"inkscape -w 32 -h 32 -o aleta/actions/32/${N}.png ${SVG}" \
		"inkscape -w 48 -h 48 -o aleta/actions/48/${N}.png ${SVG}"

		cp ${SVG} ${SVG}.tmp
		scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
		rm ${SVG}.tmp
		mv ${SVG} icons/actions-sym
	fi
done

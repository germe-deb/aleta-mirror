#! /bin/bash

for SVG in todo/apps/*.svg
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

		cp ${SVG} ${SVG}.tmp
		scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
		rm ${SVG}.tmp 
		mv ${SVG} icons/apps
	fi
done


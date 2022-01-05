#!/bin/bash

# Check dependencies
command -v scour >/dev/null 2>&1 || { echo >&2 "I cannot continue without 'scour'"; exit 1; }

for SVG in todo/apps/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        
        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp 

        mv ${SVG} icons/apps
    fi
done


for SVG in todo/categories/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        
        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp 

        mv ${SVG} icons/categories
    fi
done


for SVG in todo/devices/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        
        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp 

        mv ${SVG} icons/devices
    fi
done


for SVG in todo/places/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        
        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp 

        mv ${SVG} icons/places
    fi
done


for SVG in todo/status/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        
        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp 

        mv ${SVG} icons/status
    fi
done


for SVG in todo/mimetypes/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        
        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp 

        mv ${SVG} icons/mimetypes
    fi
done


for SVG in todo/actions/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        
        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp 

        mv ${SVG} icons/actions
    fi
done


for SVG in todo/actions-sym/*.svg
do
    if [[ -f "${SVG}" ]]; then
        N=$(basename ${SVG} .svg)
        
        cp ${SVG} ${SVG}.tmp
        scour --remove-descriptive-elements --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${SVG}.tmp -o ${SVG}
        rm ${SVG}.tmp 

        mv ${SVG} icons/actions-sym
    fi
done

for PROCESSWORKING in todo/animations/process-working.svg
do
	if [[ -f "${PROCESSWORKING}" ]]; then
		N=$(basename ${PROCESSWORKING} .svg)

		cp ${PROCESSWORKING} ${PROCESSWORKING}.tmp
		scour --enable-id-stripping --enable-viewboxing --enable-comment-stripping --nindent=4 -i ${PROCESSWORKING}.tmp -o ${PROCESSWORKING}
		rm ${PROCESSWORKING}.tmp

		mv ${PROCESSWORKING} icons/animations 
	fi
done

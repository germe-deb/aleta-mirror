#!/bin/bash
set -o errexit   # exit on error
# first, set the functions
function iconcount_set_cols ()
{
	# set the colors
	colorone="\e[1;34m"
	colortdo="\e[1;31m"
	colorcom="\e[1;32m"
	colorreset="\e[0m"
}

function iconcount_get_numbers ()
{
	# get the numbers
	
	icons_total="$(find icons/apps/ icons/places/ icons/devices/ icons/categories/ icons/status/ icons/mimetypes/ icons/actions/  icons/animations/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# apps
	icons_apps="$(find icons/apps/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# actions
	icons_actions="$(find icons/actions/  -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# categories
	icons_cate="$(find icons/categories/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# devices
	icons_devices="$(find icons/devices/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# mimetypes
	icons_mime="$(find icons/mimetypes/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# places
	icons_places="$(find icons/places/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# status
	icons_status="$(find icons/status/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# animations
	icons_animations="$(find icons/animations/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"	
}

function iconcount_display_numbers ()
{
	# print the list
	printf "${colorcom}All:        ${colorreset}${icons_total}\\n"

	printf "________________\\n"
	
	printf "${colorone}Apps:       ${colorreset}${icons_apps}\\n"

	printf "${colorone}Actions:    ${colorreset}${icons_actions}\\n"

	printf "${colorone}Categories: ${colorreset}${icons_cate}\\n"

	printf "${colorone}Devices:    ${colorreset}${icons_devices}\\n"

	printf "${colorone}Mimetypes:  ${colorreset}${icons_mime}\\n"

	printf "${colorone}Places:     ${colorreset}${icons_places}\\n"

	printf "${colorone}Status:     ${colorreset}${icons_status}\\n"

	printf "${colorone}Animations: ${colorreset}${icons_animations}\\n"

}

iconcount_set_cols
iconcount_get_numbers
iconcount_display_numbers

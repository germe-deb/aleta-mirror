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
	
	icons_total_ex="$(find icons/apps/ icons/places/ icons/devices/ icons/categories/ icons/status/ icons/mimetypes/ icons/actions/ icons/actions-sym/ icons/animations/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_total_do="$(find todo/apps/ todo/places/ todo/devices/ todo/categories/ todo/status/ todo/mimetypes/ todo/actions/ todo/actions-sym/ todo/animations/ -mindepth 1 -maxdepth  1 -not -path '*/\.*' | wc -l)"
	icons_total="$(find icons/apps/ icons/places/ icons/devices/ icons/categories/ icons/status/ icons/mimetypes/ icons/actions/ icons/actions-sym/ icons/animations/ \
	 todo/apps/ todo/places/ todo/devices/ todo/categories/ todo/status/ todo/mimetypes/ todo/actions/ todo/actions-sym/ todo/animations/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# apps
	icons_apps_ex="$(find icons/apps/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_apps_do="$(find todo/apps/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_apps="$(find icons/apps/ todo/apps/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# actions
	icons_actions_ex="$(find icons/actions/ icons/actions-sym/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_actions_do="$(find todo/actions/ todo/actions-sym/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_actions="$(find icons/actions/ icons/actions-sym/ todo/actions/ todo/actions-sym/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# categories
	icons_cate_ex="$(find icons/categories/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_cate_do="$(find todo/categories/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_cate="$(find icons/categories/ todo/categories/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# devices
	icons_devices_ex="$(find icons/devices/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_devices_do="$(find todo/devices/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_devices="$(find icons/devices/ todo/devices/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# mimetypes
	icons_mime_ex="$(find icons/mimetypes/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_mime_do="$(find todo/mimetypes/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_mime="$(find icons/mimetypes/ todo/mimetypes/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# places
	icons_places_ex="$(find icons/places/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_places_do="$(find todo/places/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_places="$(find icons/places/ todo/places/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# status
	icons_status_ex="$(find icons/status/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_status_do="$(find todo/status/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_status="$(find icons/status/ todo/status/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	
	# animations
	icons_animations_ex="$(find icons/animations/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_animations_do="$(find todo/animations/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
	icons_animations="$(find icons/animations/ todo/animations/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' | wc -l)"
}

function iconcount_display_numbers ()
{
	# print the list
	printf "${colorone}All:        ${colortdo}To-Do: ${colorreset}${icons_total_do}\\t\
${colorone}Exported: ${colorreset}${icons_total_ex}\\t\
${colorcom}Total: ${colorreset}${icons_total}\\n"

	printf "_____________________________________________________\\n"
	
	printf "${colorone}Apps:       ${colortdo}To-Do: ${colorreset}${icons_apps_do}\\t\
${colorone}Exported: ${colorreset}${icons_apps_ex}\\t\
${colorcom}Total: ${colorreset}${icons_apps}\\n"

	printf "${colorone}Actions:    ${colortdo}To-Do: ${colorreset}${icons_actions_do}\\t\
${colorone}Exported: ${colorreset}${icons_actions_ex}\\t\
${colorcom}Total: ${colorreset}${icons_actions}\\n"

	printf "${colorone}Categories: ${colortdo}To-Do: ${colorreset}${icons_cate_do}\\t\
${colorone}Exported: ${colorreset}${icons_cate_ex}\\t\
${colorcom}Total: ${colorreset}${icons_cate}\\n"

	printf "${colorone}Devices:    ${colortdo}To-Do: ${colorreset}${icons_devices_do}\\t\
${colorone}Exported: ${colorreset}${icons_devices_ex}\\t\
${colorcom}Total: ${colorreset}${icons_devices}\\n"

	printf "${colorone}Mimetypes:  ${colortdo}To-Do: ${colorreset}${icons_mime_do}\\t\
${colorone}Exported: ${colorreset}${icons_mime_ex}\\t\
${colorcom}Total: ${colorreset}${icons_mime}\\n"

	printf "${colorone}Places:     ${colortdo}To-Do: ${colorreset}${icons_places_do}\\t\
${colorone}Exported: ${colorreset}${icons_places_ex}\\t\
${colorcom}Total: ${colorreset}${icons_places}\\n"

	printf "${colorone}Status:     ${colortdo}To-Do: ${colorreset}${icons_status_do}\\t\
${colorone}Exported: ${colorreset}${icons_status_ex}\\t\
${colorcom}Total: ${colorreset}${icons_status}\\n"

	printf "${colorone}Animations: ${colortdo}To-Do: ${colorreset}${icons_animations_do}\\t\
${colorone}Exported: ${colorreset}${icons_animations_ex}\\t\
${colorcom}Total: ${colorreset}${icons_animations}\\n"

}

iconcount_set_cols
iconcount_get_numbers
iconcount_display_numbers

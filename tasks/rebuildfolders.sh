#!/bin/bash

# this is to stay secure that the folders are here
mkdir -p icons/apps
mkdir -p icons/places
mkdir -p icons/categories
mkdir -p icons/devices
mkdir -p icons/status
mkdir -p icons/mimetypes
mkdir -p icons/actions
mkdir -p icons/ui
mkdir -p icons/animations

# this creates the To export folders. the .svg will be placed here
mkdir -p _build/icons-t/apps
mkdir -p _build/icons-t/places
mkdir -p _build/icons-t/categories
mkdir -p _build/icons-t/devices
mkdir -p _build/icons-t/status
mkdir -p _build/icons-t/mimetypes
mkdir -p _build/icons-t/actions
mkdir -p _build/icons-t/animations

# this creates the Exported folders. the exported svg will be placed here
mkdir -p _build/icons-e/apps
mkdir -p _build/icons-e/places
mkdir -p _build/icons-e/categories
mkdir -p _build/icons-e/devices
mkdir -p _build/icons-e/status
mkdir -p _build/icons-e/mimetypes
mkdir -p _build/icons-e/actions
mkdir -p _build/icons-e/animations

# this creates the build folders. here is the result of the build. here will be the index.theme and the PNG exported from the svg
mkdir -p _build/aleta/apps
mkdir -p _build/aleta/places
mkdir -p _build/aleta/categories
mkdir -p _build/aleta/devices
mkdir -p _build/aleta/status
mkdir -p _build/aleta/mimetypes
mkdir -p _build/aleta/actions
mkdir -p _build/aleta/animations

# here is the .png exported.
mkdir -p _build/aleta/apps/8
mkdir -p _build/aleta/apps/16
mkdir -p _build/aleta/apps/24
mkdir -p _build/aleta/apps/32
mkdir -p _build/aleta/apps/48
mkdir -p _build/aleta/apps/64
mkdir -p _build/aleta/apps/96
mkdir -p _build/aleta/apps/128
mkdir -p _build/aleta/apps/256

mkdir -p _build/aleta/places/8
mkdir -p _build/aleta/places/16
mkdir -p _build/aleta/places/24
mkdir -p _build/aleta/places/32
mkdir -p _build/aleta/places/48
mkdir -p _build/aleta/places/64
mkdir -p _build/aleta/places/96
mkdir -p _build/aleta/places/128
mkdir -p _build/aleta/places/256

mkdir -p _build/aleta/categories/8
mkdir -p _build/aleta/categories/16
mkdir -p _build/aleta/categories/22
mkdir -p _build/aleta/categories/24
mkdir -p _build/aleta/categories/32
mkdir -p _build/aleta/categories/48
mkdir -p _build/aleta/categories/64
mkdir -p _build/aleta/categories/96
mkdir -p _build/aleta/categories/128

mkdir -p _build/aleta/devices/16
mkdir -p _build/aleta/devices/24
mkdir -p _build/aleta/devices/32
mkdir -p _build/aleta/devices/48
mkdir -p _build/aleta/devices/64
mkdir -p _build/aleta/devices/96

mkdir -p _build/aleta/status/8
mkdir -p _build/aleta/status/16
mkdir -p _build/aleta/status/24
mkdir -p _build/aleta/status/32
mkdir -p _build/aleta/status/48
mkdir -p _build/aleta/status/64
mkdir -p _build/aleta/status/96
mkdir -p _build/aleta/status/128
mkdir -p _build/aleta/status/256
mkdir -p _build/aleta/status/scalable

mkdir -p _build/aleta/mimetypes/8
mkdir -p _build/aleta/mimetypes/16
mkdir -p _build/aleta/mimetypes/22
mkdir -p _build/aleta/mimetypes/24
mkdir -p _build/aleta/mimetypes/32
mkdir -p _build/aleta/mimetypes/48
mkdir -p _build/aleta/mimetypes/64
mkdir -p _build/aleta/mimetypes/96
mkdir -p _build/aleta/mimetypes/128
mkdir -p _build/aleta/mimetypes/256

mkdir -p _build/aleta/actions/8
mkdir -p _build/aleta/actions/16
mkdir -p _build/aleta/actions/22
mkdir -p _build/aleta/actions/24
mkdir -p _build/aleta/actions/32
mkdir -p _build/aleta/actions/48
mkdir -p _build/aleta/actions/64
mkdir -p _build/aleta/actions/96
mkdir -p _build/aleta/actions/128
mkdir -p _build/aleta/actions/256

mkdir -p _build/aleta/animations/8
mkdir -p _build/aleta/animations/16
mkdir -p _build/aleta/animations/24
mkdir -p _build/aleta/animations/32
mkdir -p _build/aleta/animations/48
mkdir -p _build/aleta/animations/64
mkdir -p _build/aleta/animations/96
mkdir -p _build/aleta/animations/128
mkdir -p _build/aleta/animations/scalable

#!/bin/bash

function order () {
	liplaces 8
	liplaces 16
	liplaces 24
	liplaces 32
	liplaces 48
	liplaces 64
	liplaces 96
	liplaces 128
	liplaces 256

	liapps 8
	liapps 16
	liapps 24
	liapps 32
	liapps 48
	liapps 64
	liapps 96
	liapps 128
	liapps 256
#	liapps scalable

	lidevices 16
	lidevices 24
	lidevices 32
	lidevices 48
	lidevices 64
	lidevices 96

	licategories 8
	licategories 16
	licategories 22
	licategories 24
	licategories 32
	licategories 48
	licategories 64
	licategories 96
	licategories 128
	
	listatus 8
	listatus 16
	listatus 24
	listatus 32
	listatus 48
	listatus 64
	listatus 96
	listatus 128
	listatus 256
#	listatus scalable
	
	liactions 8
	liactions 16
	liactions 22
	liactions 24
	liactions 32
	liactions 48
	liactions 64
	liactions 96
	liactions 128
	liactions 256
	
	limime 8
	limime 16
	limime 24
	limime 32
	limime 48
	limime 64
	limime 96
	limime 128
	limime 256

}

function liplaces () {
	cd _build/aleta/places/$1
	../../../../tasks/link/linkplaces.sh
	cd ../../../..
}

function liapps () {
	cd _build/aleta/apps/$1
	../../../../tasks/link/linkapps.sh
	cd ../../../..
}

function lidevices () {
	cd _build/aleta/devices/$1
	../../../../tasks/link/linkdevices.sh
	cd ../../../..
}

function licategories () {
	cd _build/aleta/categories/$1
	../../../../tasks/link/linkcategories.sh
	cd ../../../..
}

function listatus () {
	cd _build/aleta/status/$1
	../../../../tasks/link/linkstatus.sh
	cd ../../../..
}

function liactions () {
	cd _build/aleta/actions/$1
	../../../../tasks/link/linkactions.sh
	cd ../../../..
}

function limime () {
	cd _build/aleta/mimetypes/$1
	../../../../tasks/link/linkmime.sh
	cd ../../../..
}

order

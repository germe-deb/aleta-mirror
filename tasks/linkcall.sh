#!/bin/bash

function order () {
	lipl 8
	lipl 16
	lipl 22
	lipl 24
	lipl 32
	lipl 48
	lipl 64
	lipl 96
	lipl 128
	lipl 256

	liap 8
	liap 16
	liap 22
	liap 24
	liap 32
	liap 48
	liap 64
	liap 96
	liap 128
	liap 256

	lide 8
	lide 16
	lide 22
	lide 24
	lide 32
	lide 48
	lide 64
	lide 96
	lide 128
	lide 256

	lica 8
	lica 16
	lica 22
	lica 24
	lica 32
	lica 48
	lica 64
	lica 96
	lica 128
	lica 256
		
}

function lipl () {
	cd aleta/places/$1
	./../../../tasks/link/linkplaces.sh
	cd ../../..
}

function liap () {
	cd aleta/apps/$1
	./../../../tasks/link/linkapps.sh
	cd ../../..
}

function lide () {
	cd aleta/devices/$1
	./../../../tasks/link/linkdevices.sh
	cd ../../..
}

function lica () {
	cd aleta/categories/$1
	./../../../tasks/link/linkcategories.sh
	cd ../../..
}

order

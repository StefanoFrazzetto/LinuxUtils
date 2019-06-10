#!/usr/bin/env bash

function ensure_sudo() {
	if [ "$EUID" -ne 0 ]
		then echo "Please run as root"
		exit
	fi
}
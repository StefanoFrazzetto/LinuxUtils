#!/usr/bin/env bash

usage="$(basename "$0") [-h] -- program to automatically sync your system clock using ntpd

where:
	Flag 	Extended flag 	Description
    -h 		--help 			Show this help text"

# Check whether user had supplied -h or --help.
if [[ $1 == "--help" ||  $1 == "-h" ]]
then
	echo "$usage" >&2
	exit
fi

sudo service ntp stop
sudo ntpd -gq
sudo service ntp start

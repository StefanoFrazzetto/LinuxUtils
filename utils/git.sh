#!/usr/bin/env bash

usage="$(basename "$0") <remote-name> <remote-url> -- program to set a git repository remote URL.

where:
	Flag 	Extended flag 	Description
    -h 		--help 			Show this help text"

function git_set_remote() {
	REMOTE_NAME="$1"
	REMOTE_URL="$2"
	git remote set-url "$REMOTE_NAME" "$REMOTE_URL"
}

# Convert remote to ssh, i.e. git@github.com:StefanoFrazzetto/LinuxUtils.git
function git_remote_to_ssh() {
	set -x
	REMOTE_NAME=$1
	CURRENT_URL=$(git remote get-url "$REMOTE_NAME")
	REMOTE_URL=$(echo $CURRENT_URL | sed -e "s/https:\/\/github.com\///g" | cut -d':' -f2 | sed -e "s/.git//g")
	git_set_remote "$REMOTE_NAME" "git@github.com:${REMOTE_URL}.git"
}

# Convert remote to https, i.e. https://github.com/StefanoFrazzetto/LinuxUtils.git
function git_remote_to_https() {
	set -x 
	REMOTE_NAME=$1
	CURRENT_URL=$(git remote get-url "$REMOTE_NAME")
	REMOTE_URL=$(echo $CURRENT_URL | sed -e "s/https:\/\/github.com\///g" | cut -d':' -f2 | sed -e "s/.git//g")
	git_set_remote "$REMOTE_NAME" "https://github.com/${REMOTE_URL}.git"
}
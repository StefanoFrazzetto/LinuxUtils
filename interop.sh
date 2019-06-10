#!/usr/bin/env bash

# Wrapper for commands across distributions.

this_dir="$(dirname "$0")"

# Return the distributor ID.
function detect_os() {
	bash "$this_dir/lsb_release/lsb_release" -si
}
#!/usr/bin/env bash

watch -n1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""

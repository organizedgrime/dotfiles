#!/bin/bash
set -o errexit
if [ ${EUID} != 0 ]; then
	echo "This script needs to be run as root"
	exit 1
fi

dnf install -y xdg-desktop-portal-gnome

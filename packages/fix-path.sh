#!/bin/sh

# Include config to find out OpenWRT trunk revision
. ../../config.mk

# Package name, taken as current folder name
PKG_NAME="${PWD##*/}"

#Make sure package index is exists!
[ -f ../.packages_path.mk ] || $(cd .. && ./index_scan.rb > /dev/null)

# Path to package, taken from .package_path.mk.  It will be something like
# PK_NAME_25volt="/home/ryzhovau/Entware/openwrt_trunk/feeds/rtndev/25volt/"
PK_NAME_STR=$(grep ^PK_NAME_${PKG_NAME}= ../.packages_path.mk)

# Take a substring between double quotes, remove trailing slash
FULL_PATH=$(echo $PK_NAME_STR | cut -d'"' -f2 | sed 's/\/$//')

# Find full path to OpenWRT trunk folder to cut it out from $FULL_PATH
ROOT_PATH=$(cd ../../../openwrt_trunk && pwd -P)

# Short path to package folder, relative to the openwrt_trunk folder
SHORT_PATH=${FULL_PATH#${ROOT_PATH}/}

# A basic packages from openwrt_trunk/package is not indexed, trying
# to find it manually
[ -z "$SHORT_PATH" ] && \
    SHORT_PATH=$(find ../../../openwrt_trunk/package/ -type d -name $PKG_NAME | \
	sed 's/^\.\.\/\.\.\/\.\.\/openwrt_trunk\///' | head -n 1)

# Nothing found? Give up.
if [ -z "$SHORT_PATH" ];
then
    echo "No package found. Current folder name is matched with no any package."
    exit 1
fi

# Take a recursive diff on package folder if "-r" parameter is given,
# or diff on Makefiles otherwise.
case $1 in
-r)
    diff -urx .svn ../../../downloads/openwrt_trunk-r${OPENWRT_REVISION}/${SHORT_PATH} \
	../../../openwrt_trunk/${SHORT_PATH}
    ;;
*)
    diff -u ../../../downloads/openwrt_trunk-r${OPENWRT_REVISION}/${SHORT_PATH}/Makefile \
	../../../openwrt_trunk/${SHORT_PATH}/Makefile
    ;;
esac

# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#

RTN_DIR:=${CURDIR}
export RTN_DIR

all: rtn_target patch_packages buildroot_config

rtn_target:
	cp -r $(RTN_DIR)/.target $(RTN_DIR)/../trunk/target
	touch $(RTN_DIR)/.target_built

patch_packages:
	cd $(RTN_DIR)
	for i in "package-*.patch"
	  do
#	    patch -p0 -i $i
	  done
	touch $(RTN_DIR)/.packages_patched

buildroot_config:
	cd $(RTN_DIR)
	for i in "buildroot-*.patch"
	  do
#	    patch -p0 -i $i
	  done
	cd $(RTN_DIR)../trunk
	echo CONFIG_TARGET_rtn=y > .config
	make defconfig
	cp -f $(RTN_DIR)/.config $(RTN_DIR)/../.config
	touch $(RTN_DIR)/.buildroot_configured

clean:
	rm -f $(RTN_DIR)/.buildroot_configured $(RTN_DIR)/.packages_patched $(RTN_DIR)/.target_built

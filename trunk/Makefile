# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#

RTN_DIR:=${CURDIR}
export RTN_DIR

all: rtn_target patch_packages buildroot_config

rtn_target: $(RTN_DIR)/.target_built
$(RTN_DIR)/.target_built:
	tar -C $(RTN_DIR)/../trunk -xvf $(RTN_DIR)/rtn-target.tgz
	touch $(RTN_DIR)/.target_built

patch_packages: $(RTN_DIR)/.packages_patched
$(RTN_DIR)/.packages_patched:
	cd $(RTN_DIR)
	for i in $(RTN_DIR)/package-*.patch; do \
	    echo patch -p0 -i $$i; \
	done;
	touch $(RTN_DIR)/.packages_patched

buildroot_config: $(RTN_DIR)/.buildroot_configured
$(RTN_DIR)/.buildroot_configured:
	cd $(RTN_DIR)
	for i in $(RTN_DIR)/buildroot-*.patch; do \
	    echo patch -p0 -i $$i; \
	done;
	cd $(RTN_DIR)/../trunk
	echo CONFIG_TARGET_rtn=y > $(RTN_DIR)/../trunk/.config
	make -C $(RTN_DIR)/../trunk defconfig
	cp -f $(RTN_DIR)/.config $(RTN_DIR)/../trunk/.config
	touch $(RTN_DIR)/.buildroot_configured

ipk_index: $(RTN_DIR)/.ipk_indexed
$(RTN_DIR)/.ipk_indexed:
	rm -f $(RTN_DIR)/../trunk/bin/rtn/packages/Packages*
	cd $(RTN_DIR)/../trunk
	$(RTN_DIR)/../trunk/scripts/ipkg-make-index.sh $(RTN_DIR)/../trunk/bin/rtn/packages > $(RTN_DIR)/../trunk/bin/rtn/packages/Packages
	gzip -c $(RTN_DIR)/../trunk/bin/rtn/packages/Packages > $(RTN_DIR)/../trunk/bin/rtn/packages/Packages.gz
	touch $(RTN_DIR)/.ipk_indexed

clean:
	rm -f $(RTN_DIR)/.buildroot_configured $(RTN_DIR)/.packages_patched $(RTN_DIR)/.target_built $(RTN_DIR)/.ipk_indexed

.PHONY : clean
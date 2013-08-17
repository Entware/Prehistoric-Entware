#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include ../config.mk

all: .kernel_prepared .toolchain_compiled

kernel_prepare: .kernel_prepared
.kernel_prepared:
	@echo Preparing kernel sources, r$(TOOLCHAIN_REVISION)...
	if [ -f $(TOP)/downloads/entware-kernel-r$(TOOLCHAIN_REVISION).tgz ]; then \
	    tar -C $(TOP) -xf $(TOP)/downloads/entware-kernel-r$(TOOLCHAIN_REVISION).tgz; \
	else \
	    [ -d $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION) ] || svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/trunk/ $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION); \
	    mkdir -p $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn; \
	    cp --recursive --update --force $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION)/* $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn; \
	    mkdir -p $(TOP)/kernel-1.9.2.7-rtn/src/linux; \
	    [ -f $(TOP)/downloads/linux-2.6.22.19.tar.bz2 ] || wget http://wl500g.googlecode.com/files/linux-2.6.22.19.tar.bz2 -O $(TOP)/downloads/linux-2.6.22.19.tar.bz2; \
	    tar -C $(TOP)/kernel-1.9.2.7-rtn/src/linux -jxf $(TOP)/downloads/linux-2.6.22.19.tar.bz2; \
	    ln -sf linux-2.6.22.19 $(TOP)/kernel-1.9.2.7-rtn/src/linux/linux-2.6; \
	    (cd $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn; make kernel; make); \
	    mv $(TOP)/kernel-1.9.2.7-rtn/src/linux/linux-2.6.22.19 $(TOP)/; \
	    rm -fr $(TOP)/kernel-1.9.2.7-rtn; \
	    (cd $(TOP); tar -czf $(TOP)/downloads/entware-kernel-r$(TOOLCHAIN_REVISION).tgz ./linux-2.6.22.19); \
	fi
	@echo Kernel files ready.
	touch $@

toolchain_compile: .toolchain_compiled
.toolchain_compiled:
	@echo Making /opt/entware-toolchain directory, root password needed...
	sudo mkdir -p /opt/entware-toolchain
	@echo chmod /opt/entware-toolchain directory for all users access, root password needed...
	sudo chmod 777 /opt/entware-toolchain
	@echo Making toolchain, $(TOOLCHAIN_REVISION)...
	if [ -f $(TOP)/downloads/entware-toolchain-r$(TOOLCHAIN_REVISION).tgz ]; then \
	    sudo tar -C / -xf $(TOP)/downloads/entware-toolchain-r$(TOOLCHAIN_REVISION).tgz; \
	else \
	    [ -d $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION) ] || svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/toolchain $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION); \
	    mkdir -p $(TOP)/toolchain-1.9.2.7-rtn/src; \
	    cp --recursive --update --force $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION)/* $(TOP)/toolchain-1.9.2.7-rtn/src; \
	    cp -f $(TOP)/toolchain-1.9.2.7-rtn/src/defconfig $(TOP)/toolchain-1.9.2.7-rtn/src/.config; \
	    sed -i -e 's|^\(CONFIG_EXTERNAL_KERNEL_TREE\)=.*|\1=\"$(TOP)/linux-2.6.22.19\"|g' $(TOP)/toolchain-1.9.2.7-rtn/src/.config; \
	    sed -i -e 's|^\(CONFIG_DOWNLOAD_FOLDER\)=.*|\1=\"$(TOP)/downloads\"|g' $(TOP)/toolchain-1.9.2.7-rtn/src/.config; \
	    cp -f ./*-uclibc-*.patch  $(TOP)/toolchain-1.9.2.7-rtn/src/toolchain/uClibc/patches/0.9.32/; \
	    patch -d $(TOP) -p2 -i $(CURDIR)/0.9.32-config.patch; \
	    patch -d $(TOP) -p2 -i $(CURDIR)/add-mirror.patch; \
	    patch -d $(TOP) -p2 -i $(CURDIR)/define-toolchain-path.patch; \
	    echo Compiling toolchain...; \
	    (cd $(TOP)/toolchain-1.9.2.7-rtn/src; make V=99); \
	    rm -fr $(TOP)/toolchain-1.9.2.7-rtn; \
	    tar -cvzf $(TOP)/downloads/entware-toolchain-r$(TOOLCHAIN_REVISION).tgz /opt/entware-toolchain; \
	fi
	@echo Toolchain deployment finished.
	touch $@

distclean:
	rm -f ./.kernel_prepared
	rm -f ./.toolchain_compiled

clean:
	rm -f ./.kernel_prepared
	rm -f ./.toolchain_compiled
	rm -fr $(TOP)/linux-2.6.22.19
	@echo Root access needed to remove toolchain...
	sudo rm -fr /opt/entware-toolchain

.PHONY : distclean clean

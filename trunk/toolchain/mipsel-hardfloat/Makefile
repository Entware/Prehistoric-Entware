#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../../.. && pwd -P))

include ../../config.mk

all: .toolchain_prepared

.toolchain_prepared: .toolchain .kernel
	@touch $@

.toolchain: $(TOP)/downloads/$(TARGET)/entware-toolchain-r$(TOOLCHAIN_REVISION).tgz \
	    /opt/entware-toolchain
	sudo tar -C / -xf $(TOP)/downloads/$(TARGET)/entware-toolchain-r$(TOOLCHAIN_REVISION).tgz
	@touch $@

.kernel: $(TOP)/downloads/$(TARGET)/entware-kernel-r$(TOOLCHAIN_REVISION).tgz
	tar -C $(TOP) -xf $(TOP)/downloads/$(TARGET)/entware-kernel-r$(TOOLCHAIN_REVISION).tgz
	@touch $@

$(TOP)/downloads/$(TARGET)/entware-toolchain-r$(TOOLCHAIN_REVISION).tgz: \
	    $(TOP)/downloads/$(TARGET)/entware-kernel-r$(TOOLCHAIN_REVISION).tgz \
	    $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION) \
	    $(TOP)/downloads/$(TARGET)
	mkdir -p $(TOP)/toolchain-1.9.2.7-rtn/src
	cp --recursive --update --force $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION)/* $(TOP)/toolchain-1.9.2.7-rtn/src
	cp -f $(TOP)/toolchain-1.9.2.7-rtn/src/defconfig $(TOP)/toolchain-1.9.2.7-rtn/src/.config
	sed -i -e 's|^\(CONFIG_EXTERNAL_KERNEL_TREE\)=.*|\1=\"$(TOP)/linux-2.6.22.19\"|g' $(TOP)/toolchain-1.9.2.7-rtn/src/.config
	sed -i -e 's|^\(CONFIG_DOWNLOAD_FOLDER\)=.*|\1=\"$(TOP)/downloads\"|g' $(TOP)/toolchain-1.9.2.7-rtn/src/.config
	cp -f ./*-uclibc-*.patch  $(TOP)/toolchain-1.9.2.7-rtn/src/toolchain/uClibc/patches/0.9.32/
	patch -d $(TOP) -p3 -i $(CURDIR)/0.9.32-config.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/add-mirrors.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/define-toolchain-path.patch
	@echo Compiling toolchain...
	$(MAKE) -C "$(TOP)/toolchain-1.9.2.7-rtn/src" V=99
	rm -fr $(TOP)/toolchain-1.9.2.7-rtn
	tar -czf $(TOP)/downloads/$(TARGET)/entware-toolchain-r$(TOOLCHAIN_REVISION).tgz /opt/entware-toolchain
	@echo Toolchain files ready.

$(TOP)/downloads/$(TARGET)/entware-kernel-r$(TOOLCHAIN_REVISION).tgz: \
	    $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION) \
	    $(TOP)/downloads/linux-2.6.22.19.tar.bz2 \
	    $(TOP)/downloads/$(TARGET) \
	    /opt/entware-toolchain
	mkdir -p $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn
	cp --recursive --update --force $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION)/* $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn
	mkdir -p $(TOP)/kernel-1.9.2.7-rtn/src/linux
	tar -C $(TOP)/kernel-1.9.2.7-rtn/src/linux -jxf $(TOP)/downloads/linux-2.6.22.19.tar.bz2
	ln -sf linux-2.6.22.19 $(TOP)/kernel-1.9.2.7-rtn/src/linux/linux-2.6
	sed -i -e 's|^\(TOOLCHAINDIR\)=.*|\1=/opt/entware-toolchain|g' $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn/config/defconfig
	$(MAKE) -C "$(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn" kernel
	$(MAKE) -C "$(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn"
	mv $(TOP)/kernel-1.9.2.7-rtn/src/linux/linux-2.6.22.19 $(TOP)/
	rm -fr $(TOP)/kernel-1.9.2.7-rtn
	(cd $(TOP); tar -czf $(TOP)/downloads/$(TARGET)/entware-kernel-r$(TOOLCHAIN_REVISION).tgz ./linux-2.6.22.19)
	@echo Kernel files ready.

$(TOP)/downloads/linux-2.6.22.19.tar.bz2: $(TOP)/downloads/$(TARGET)
	wget http://wl500g.googlecode.com/files/linux-2.6.22.19.tar.bz2 -O $(TOP)/downloads/linux-2.6.22.19.tar.bz2
	@touch $@

$(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION): $(TOP)/downloads/$(TARGET)
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/trunk/ $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION)

$(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION): $(TOP)/downloads/$(TARGET)
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/toolchain $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION)

/opt/entware-toolchain:
	@echo Making /opt/entware-toolchain directory, root password needed...
	sudo mkdir -p /opt/entware-toolchain/bin
	@echo chmod /opt/entware-toolchain directory for all users access, root password needed...
	sudo chmod -R 777 /opt/entware-toolchain

$(TOP)/downloads/$(TARGET):
	[ -d "$(TOP)/downloads/$(TARGET)" ] || mkdir -p "$(TOP)/downloads/$(TARGET)"

clean:
	@rm -f .toolchain_prepared
	@rm -f .kernel
	@rm -f .toolchain
	@rm -fr $(TOP)/kernel-1.9.2.7-rtn
	@rm -fr $(TOP)/toolchain-1.9.2.7-rtn

cleanall: clean
	@rm -fr $(TOP)/linux-2.6.22.19
	@echo Root access may needed to remove toolchain...
	@sudo rm -fr /opt/entware-toolchain

.PHONY: clean cleanall all

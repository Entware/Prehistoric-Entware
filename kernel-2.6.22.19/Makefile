#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../.. && pwd -P))
ARCH_NAME=kernel-r$(TOOLCHAIN_REVISION).tgz
include ../config.mk

all: .kernel_prepared

.kernel_prepared: $(TOP)/downloads/$(ARCH_NAME)
	tar -C $(TOP) -xf $(TOP)/downloads/$(ARCH_NAME)
	@touch $@

ifdef FORCE_COMPILE
$(TOP)/downloads/$(ARCH_NAME): \
	    $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION) \
	    $(TOP)/downloads/linux-2.6.22.19.tar.bz2 \
	    $(TOP)/downloads
	mkdir -p $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn
	cp --recursive --update --force $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION)/* $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn
	mkdir -p $(TOP)/kernel-1.9.2.7-rtn/src/linux
	tar -C $(TOP)/kernel-1.9.2.7-rtn/src/linux -jxf $(TOP)/downloads/linux-2.6.22.19.tar.bz2
	ln -sf linux-2.6.22.19 $(TOP)/kernel-1.9.2.7-rtn/src/linux/linux-2.6
# Some workaround for wl500g sources
	sed -i -e 's|^\(TOOLCHAINDIR\)=.*|\1=$(TOP)|g' $(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn/config/defconfig
	$(MAKE) -C "$(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn" kernel
	$(MAKE) -C "$(TOP)/kernel-1.9.2.7-rtn/src/1.9.2.7-rtn"
	mv $(TOP)/kernel-1.9.2.7-rtn/src/linux/linux-2.6.22.19 $(TOP)/
	rm -fr $(TOP)/kernel-1.9.2.7-rtn
	tar -C $(TOP) -czf $(TOP)/downloads/$(ARCH_NAME) ./linux-2.6.22.19
	@echo Kernel files are compiled.
else
$(TOP)/downloads/$(ARCH_NAME): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(ARCH_NAME) ] || wget $(SRC_MIRROR)/$(ARCH_NAME) \
	    -O $(TOP)/downloads/$(ARCH_NAME)
	@echo Kernel files are downloaded.
endif

$(TOP)/downloads/linux-2.6.22.19.tar.bz2: $(TOP)/downloads
	[ -f $(TOP)/downloads/linux-2.6.22.19.tar.bz2 ] || wget $(SRC_MIRROR)/linux-2.6.22.19.tar.bz2 \
	    -O $(TOP)/downloads/linux-2.6.22.19.tar.bz2

$(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION): $(TOP)/downloads
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/trunk/ $(TOP)/downloads/kernel-src-r$(TOOLCHAIN_REVISION)

$(TOP)/downloads:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"

clean:
	@rm -f .kernel_prepared
	@rm -fr $(TOP)/kernel-1.9.2.7-rtn

cleanall: clean
	@rm -fr $(TOP)/linux-2.6.22.19

.PHONY: clean cleanall all

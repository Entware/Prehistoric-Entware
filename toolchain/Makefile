#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../.. && pwd -P))

CROSS=crosstool-ng-1.5.3
CROSS_ARCH=$(CROSS).tar.bz2
GCC_ARCH=gcc-4.2.0.tar.bz2
GLIBC_ARCH=glibc-2.6.1.tar.bz2
BINUTILS_ARCH=binutils-2.19.1.tar.bz2
KERNEL_ARCH=linux-2.6.31.tar.bz2

include ../config.mk

all: .toolchain_prepared

.toolchain_prepared: \
	$(TOP)/cross \
	$(TOP)/downloads
	tar -C $(TOP)/cross -xf $(TOP)/downloads/$(CROSS_ARCH)
	( \
		cd $(TOP)/cross/$(CROSS) && \
		./configure --local && \
		$(MAKE) \
	)
	cp -f ./.config $(TOP)/cross
	sed -i \
		-e '/^CT_LOCAL_TARBALLS_DIR/s|=.*|="$(TOP)/downloads"|' \
		-e '/^CT_PREFIX_DIR/s|=.*|="$(TOP)/$${CT_TARGET}"|' \
	$(TOP)/cross/.config
	( \
		cd $(TOP)/cross && \
		./$(CROSS)/ct-ng oldconfig && \
		./$(CROSS)/ct-ng build \
	)
	patch -d $(TOP)/cross/targets/src/linux-2.6.31/ -p1 < kernel-scsi-h.patch
	@touch $@

$(TOP)/cross:
	mkdir -p $(TOP)/cross

$(TOP)/downloads:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"
	[ -f "$(TOP)/downloads/$(BINUTILS_ARCH)" ] || wget $(SRC_MIRROR)/$(BINUTILS_ARCH) -O $(TOP)/downloads/$(BINUTILS_ARCH)
	[ -f "$(TOP)/downloads/$(GCC_ARCH)"      ] || wget $(SRC_MIRROR)/$(GCC_ARCH)      -O $(TOP)/downloads/$(GCC_ARCH)
	[ -f "$(TOP)/downloads/$(GLIBC_ARCH)"    ] || wget $(SRC_MIRROR)/$(GLIBC_ARCH)    -O $(TOP)/downloads/$(GLIBC_ARCH)
	[ -f "$(TOP)/downloads/$(KERNEL_ARCH)"   ] || wget $(SRC_MIRROR)/$(KERNEL_ARCH)   -O $(TOP)/downloads/$(KERNEL_ARCH)
	[ -f "$(TOP)/downloads/$(CROSS_ARCH)"    ] || wget $(SRC_MIRROR)/$(CROSS_ARCH)    -O $(TOP)/downloads/$(CROSS_ARCH)
clean:
	@rm -f .toolchain_prepared
	@rm -fr $(TOP)/cross

cleanall: clean

.PHONY: clean cleanall all

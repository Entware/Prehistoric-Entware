#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../.. && pwd -P))

CROSS=crosstool-ng-1.20.0
CROSS_ARCH=$(CROSS).tar.bz2
GCC_ARCH=gcc-4.8.3.tar.bz2
MPFR_ARCH=mpfr-3.1.2.tar.xz
CLOOG_ARCH=cloog-0.18.1.tar.gz
ISL_ARCH=isl-0.12.2.tar.lzma
MPC_ARCH=mpc-1.0.2.tar.gz
GLIBC_ARCH=glibc-2.20.tar.xz
BINUTILS_ARCH=binutils-2.24.tar.bz2
KERNEL_ARCH=linux-2.6.32.63.tar.xz


include ../config.mk

all: .toolchain_prepared

.toolchain_prepared: \
	$(TOP)/cross/$(TARGET) \
	$(TOP)/downloads \
	$(TOP)/downloads/$(BINUTILS_ARCH) \
	$(TOP)/downloads/$(GCC_ARCH) \
	$(TOP)/downloads/$(MPFR_ARCH) \
	$(TOP)/downloads/$(CLOOG_ARCH) \
	$(TOP)/downloads/$(ISL_ARCH) \
	$(TOP)/downloads/$(MPC_ARCH) \
	$(TOP)/downloads/$(GLIBC_ARCH) \
	$(TOP)/downloads/$(KERNEL_ARCH) \
	$(TOP)/downloads/$(CROSS_ARCH)
	tar -C $(TOP)/cross/$(TARGET) -xf $(TOP)/downloads/$(CROSS_ARCH)
	patch -d $(TOP)/cross/$(TARGET)/$(CROSS) -p1 < glib220_add_from_upstream.patch
	( \
		cd $(TOP)/cross/$(TARGET)/$(CROSS) && \
		./bootstrap && \
		./configure --enable-local && \
		sed -i 's|$$(error Recursion detected, bailing out...)|\t@echo NotError|g' $(TOP)/cross/$(TARGET)/$(CROSS)/Makefile && \
		$(MAKE) \
	)
	cp -f ./.config.$(TARGET) $(TOP)/cross/$(TARGET)
	mkdir -p $(TOP)/cross/$(TARGET)/$(CROSS)/patches/glibc/2.20
	rm -f $(TOP)/cross/.build/src/.glibc*
	cp -f ./999-qnapware-locale-dirs-glibc220_$(TARGET).patch $(TOP)/cross/$(TARGET)/$(CROSS)/patches/glibc/2.20
	mv -f -T $(TOP)/cross/$(TARGET)/.config.$(TARGET) $(TOP)/cross/$(TARGET)/.config
	sed -i \
		-e '/^CT_LOCAL_TARBALLS_DIR/s|=.*|="$(TOP)/downloads"|' \
		-e '/^CT_PREFIX_DIR/s|=.*|="$(TOP)/$${CT_TARGET}"|' \
		-e '/^CT_WORK_DIR/s|=.*|="$(TOP)/cross/.build"|' \
	$(TOP)/cross/$(TARGET)/.config
	( \
		cd $(TOP)/cross/$(TARGET) && \
		./$(CROSS)/ct-ng oldconfig && \
		./$(CROSS)/ct-ng build \
	)
	@touch $@

$(TOP)/cross/$(TARGET):
	mkdir -p $(TOP)/cross/$(TARGET)

$(TOP)/downloads:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"

$(TOP)/downloads/$(BINUTILS_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(BINUTILS_ARCH) ] || wget $(SRC_MIRROR)/$(BINUTILS_ARCH) \
		-O $(TOP)/downloads/$(BINUTILS_ARCH)
	@echo "Binutils downloaded"

$(TOP)/downloads/$(GCC_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(GCC_ARCH) ]      || wget $(SRC_MIRROR)/$(GCC_ARCH) \
		-O $(TOP)/downloads/$(GCC_ARCH)
	@echo "GCC downloaded"

$(TOP)/downloads/$(MPFR_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(MPFR_ARCH) ]      || wget $(SRC_MIRROR)/$(MPFR_ARCH) \
		-O $(TOP)/downloads/$(MPFR_ARCH)
	@echo "mpfr downloaded"

$(TOP)/downloads/$(CLOOG_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(CLOOG_ARCH) ]      || wget $(SRC_MIRROR)/$(CLOOG_ARCH) \
		-O $(TOP)/downloads/$(CLOOG_ARCH)
	@echo "cloog downloaded"

$(TOP)/downloads/$(ISL_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(ISL_ARCH) ]      || wget $(SRC_MIRROR)/$(ISL_ARCH) \
		-O $(TOP)/downloads/$(ISL_ARCH)
	@echo "ISL downloaded"

$(TOP)/downloads/$(MPC_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(MPC_ARCH) ]      || wget $(SRC_MIRROR)/$(MPC_ARCH) \
		-O $(TOP)/downloads/$(MPC_ARCH)
	@echo "mpc downloaded"

$(TOP)/downloads/$(GLIBC_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(GLIBC_ARCH) ]     || wget $(SRC_MIRROR)/$(GLIBC_ARCH) \
		-O $(TOP)/downloads/$(GLIBC_ARCH)
	@echo "GLIBC downloaded"

$(TOP)/downloads/$(KERNEL_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(KERNEL_ARCH) ]   || wget $(SRC_MIRROR)/$(KERNEL_ARCH) \
		-O $(TOP)/downloads/$(KERNEL_ARCH)
	@echo "Kernel downloaded"

$(TOP)/downloads/$(CROSS_ARCH): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(CROSS_ARCH) ]    || wget $(SRC_MIRROR)/$(CROSS_ARCH) \
		-O $(TOP)/downloads/$(CROSS_ARCH)
	@echo "Crosstool downloaded"

clean:
	@rm -f .toolchain_prepared
	@rm -fr $(TOP)/cross

cleanall: clean

.PHONY: clean cleanall all

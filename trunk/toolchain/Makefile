# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#
include ../config.mk

all: .firmware_prepared .toolchain_compiled

.firmware_prepared:
	@echo Installing firmware, revision $(FIRMWARE_REVISION)...
	svn checkout --revision $(FIRMWARE_REVISION) http://wl500g.googlecode.com/svn/trunk/ ../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/1.9.2.7-rtn
	mkdir ../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/linux
	wget http://wl500g.googlecode.com/files/linux-2.6.22.19.tar.bz2 -O ../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/linux/linux-2.6.22.19.tar.bz2
	tar -C ../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/linux -jxvf ../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/linux/linux-2.6.22.19.tar.bz2
	ln -sf linux-2.6.22.19 ../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/linux/linux-2.6
	make -C "../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/1.9.2.7-rtn" kernel
	make -C "../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/1.9.2.7-rtn"
	touch $@

.toolchain_compiled:
	@echo Making /opt/brcm directory, root password needed...
	sudo mkdir -p /opt/brcm
	@echo chmod /opt/brcm directory for all users access, root password needed...
	sudo chmod 777 /opt/brcm
	@echo Downloading toolchain sources, revision $(TOOLCHAIN_REVISION)...
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/toolchain ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src
	cp -f ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/defconfig ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/.config
	sed -i 's,/home/lly/Wl500/rt-n/linux/linux-2.6/,${CURDIR}/../../firmware-1.9.2.7-rtn-$(FIRMWARE_REVISION)/src/linux/linux-2.6,g' ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/.config
	@echo Fixme: apply uClibc patches for ld.so*
	sed -i 's,# UCLIBC_HAS_LOCALE is not set,UCLIBC_HAS_LOCALE=y,g' ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/toolchain/uClibc/config/0.9.32/common
	@echo Compiling toolchain, revision $(TOOLCHAIN_REVISION)...
	make -C "../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src" V=99
	ln -sf /opt/brcm/hndtools-mipsel-uclibc-4.4.6-K26 /opt/brcm/hndtools-mipsel-uclibc
	touch $@

clean:
	rm -f ./.firmware_prepared
	rm -f ./.toolchain_compiled

.PHONY : clean
# Makefile for OpenWrt Buildroot 
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#
include ../config.mk

all: .firmware_prepared .toolchain_compiled

.firmware_prepared:
	@echo Installing firmware, revision $(TOOLCHAIN_REVISION)...
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/trunk/ ../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/1.9.2.7-rtn
	mkdir ../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/linux
	wget http://wl500g.googlecode.com/files/linux-2.6.22.19.tar.bz2 -O ../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/linux/linux-2.6.22.19.tar.bz2
	tar -C ../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/linux -jxvf ../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/linux/linux-2.6.22.19.tar.bz2
	ln -sf linux-2.6.22.19 ../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/linux/linux-2.6
	make -C "../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/1.9.2.7-rtn" kernel
	make -C "../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/1.9.2.7-rtn"
	touch $@

.toolchain_compiled:
	@echo making /opt/brcm directory, root password needed...
	sudo mkdir -p /opt/brcm
	@echo chmod /opt/brcm directory for all users access, root password needed...
	sudo chmod 777 /opt/brcm
	@echo Compiling toolchain, revision $(TOOLCHAIN_REVISION)...
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/toolchain ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src
	cp -f ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/defconfig ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/.config
	sed -i 's,/home/lly/Wl500/rt-n/linux/linux-2.6/,${CURDIR}/../../firmware-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/linux/linux-2.6,g' ../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src/.config
	@echo fixme: apply uClibc patches for ld.so* and turn on locales support
	make -C "../../toolchain-1.9.2.7-rtn-$(TOOLCHAIN_REVISION)/src"
	touch $@

clean:
	rm -f ./.firmware_prepared
	rm -f ./.toolchain_compiled

.PHONY : clean
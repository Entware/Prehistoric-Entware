# Makefile for OpenWrt Buildroot. It fixes buildroot and its packages for using on Asus RT-Nxx with wl500g.googlecode.com firmware
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#
include ./config.mk

#RTN_TOOLCHAIN_FILENAME is a temporary solution. Will be deprecated after toolchain compilation.
RTN_TOOLCHAIN_FILENAME:=hndtools-mipsel-uclibc-4.4.6-K26-x86_64-r3458.tar.bz2

all: .toolchain_installed .buildroot_installed .packages_prepared .packages_compiled
#all: .toolchain_downloaded .buildroot_installed .packages_prepared .packages_compiled

packages_compile: .packages_compiled
.packages_compiled:
	make -C "../trunk" tools/compile
	make -C "../trunk" tools/install
	make -C "../trunk" packages/compile
	make -C "../trunk" packages/index
	touch $@

packages: .packages_prepared
.packages_prepared:
	@echo Processing OpenWRT packages...
	@for dir in `ls ./packages`; do ( \
	    make -C "./packages/$$dir"; \
	); done
	@echo Done!
	touch $@

buildroot: .buildroot_installed
.buildroot_installed:
	@echo Deploying OpenWRT Buildroot...
	(cd ..; \
	svn co svn://svn.openwrt.org/openwrt/trunk/ ./trunk; \
	cd ./trunk; \
	./scripts/feeds update packages; \
	./scripts/feeds install -a -p packages; \
	cp -f ../rtn/buildroot/feeds.conf ./; \
	./scripts/feeds update rtndev; \
	./scripts/feeds install -a -p rtndev)
ifeq ($(BUILDROOT_BACKUP),yes)
	mkdir -p ../trunk_clean
	cp --recursive --update --force ../trunk/* ../trunk_clean
endif
	make -C "./buildroot"
	touch $@

toolchain: .toolchain_installed
.toolchain_installed:
	make -C "./toolchain"
	touch $@

toolchain_download: .toolchain_downloaded
.toolchain_downloaded:
	@echo Making /opt/brcm directory, root password needed...
	sudo mkdir -p /opt/brcm
	@echo chmod /opt/brcm directory for all users access, root password needed...
	sudo chmod 777 /opt/brcm
	wget http://wl500g.googlecode.com/files/$(RTN_TOOLCHAIN_FILENAME)
	tar -C /opt/brcm -jxvf ./$(RTN_TOOLCHAIN_FILENAME)
	ln -sf /opt/brcm/hndtools-mipsel-uclibc-4.4.6-K26 /opt/brcm/hndtools-mipsel-uclibc
	rm -f ./$(RTN_TOOLCHAIN_FILENAME)
	touch $@

clean:
	@for dir in `ls ./packages`; do ( \
	    make -C "./packages/$$dir" clean; \
	); done
	rm -f .packages_prepared
	make -C "./buildroot" clean
	rm -f .buildroot_installed
	make -C "./toolchain" clean
	rm -f .toolchain_installed
	rm -f .toolchain_downloaded
	rm -f .packages_compiled

.PHONY : clean
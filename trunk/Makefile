# Makefile for OpenWrt Buildroot. It fixes buildroot and its packages for using on Asus RT-Nxx with wl500g.googlecode.com firmware
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#

RTN_TOOLCHAIN_FILENAME:=hndtools-mipsel-uclibc-4.4.6-K26-x86_64-r3458.tar.bz2
# You need it only for toolchain installation


all: ./.done
./.done:
	@echo Processing OpenWRT Buildroot...
	@for dir in `ls ./fixes`; do ( \
	    echo Processing "$$dir"; \
	    make -C "./fixes/$$dir"; \
	); done
	@echo Done!
	touch $@

ipk_index: ./.ipk_indexed
./.ipk_indexed:
	rm -f ../trunk/bin/rtn/packages/Packages ../trunk/bin/rtn/packages/Packages.gz
	(cd ../trunk/bin/rtn/packages; \
	../../../scripts/ipkg-make-index.sh . > ./Packages; \
	gzip -9c ./Packages > ./Packages.gz)
	touch $@

buildroot_install: ./.buildroot_installed
./.buildroot_installed:
	(cd ..; \
	svn co svn://svn.openwrt.org/openwrt/trunk/ ./trunk; \
	cd ./trunk; \
	./scripts/feeds update packages; \
	./scripts/feeds install -a -p packages)
	touch $@

toolchain_install: ./.toolchain_installed
./.toolchain_installed:
	mkdir -p /opt/brcm
	wget http://wl500g.googlecode.com/files/$(RTN_TOOLCHAIN_FILENAME)
	tar -C /opt/brcm -jxvf ./$(RTN_TOOLCHAIN_FILENAME)
	ln -sf /opt/brcm/hndtools-mipsel-uclibc-4.4.6-K26 /opt/brcm/hndtools-mipsel-uclibc
	rm -f ./$(RTN_TOOLCHAIN_FILENAME)
	touch $@

clean:
	@for dir in `ls ./fixes`; do ( \
	    rm -f -v ./fixes/$$dir/.done \
	); done
	rm -f ./.ipk_indexed
	rm -f ./.done
	rm -f ./.buildroot_installed
	rm -f ./.toolchain_installed

.PHONY : clean
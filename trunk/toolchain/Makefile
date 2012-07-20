#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include ../config.mk

all: .kernel_prepared .toolchain_compiled

kernel_prepare: .kernel_prepared
.kernel_prepared:
	@echo Deploying kernel sources, $(TOOLCHAIN_REVISION)...
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/trunk/ ../../kernel-1.9.2.7-rtn/src/1.9.2.7-rtn
	mkdir ../../kernel-1.9.2.7-rtn/src/linux
	wget http://wl500g.googlecode.com/files/linux-2.6.22.19.tar.bz2 -O ../../kernel-1.9.2.7-rtn/src/linux/linux-2.6.22.19.tar.bz2
	tar -C ../../kernel-1.9.2.7-rtn/src/linux -jxvf ../../kernel-1.9.2.7-rtn/src/linux/linux-2.6.22.19.tar.bz2
	ln -sf linux-2.6.22.19 ../../kernel-1.9.2.7-rtn/src/linux/linux-2.6
	(cd ../../kernel-1.9.2.7-rtn/src/1.9.2.7-rtn; \
	make kernel; \
	make)
	mv ../../kernel-1.9.2.7-rtn/src/linux/linux-2.6.22.19 ../../
	rm -fr ../../kernel-1.9.2.7-rtn
	touch $@

kernel_pack: .kernel_prepared .kernel_packed
.kernel_packed:
	tar -cvzf ../../entware-kernel-$(TOOLCHAIN_REVISION).tgz ../../linux-2.6.22.19
	touch $@

toolchain_compile: .toolchain_compiled
.toolchain_compiled:
	@echo Making /opt/entware-toolchain directory, root password needed...
	sudo mkdir -p /opt/entware-toolchain
	@echo chmod /opt/entware-toolchain directory for all users access, root password needed...
	sudo chmod 777 /opt/entware-toolchain
	@echo Downloading toolchain sources, $(TOOLCHAIN_REVISION)...
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/toolchain ../../toolchain-1.9.2.7-rtn/src
	cp -f ../../toolchain-1.9.2.7-rtn/src/defconfig ../../toolchain-1.9.2.7-rtn/src/.config
	sed -i 's,/home/lly/Wl500/rt-n/linux/linux-2.6/,${CURDIR}/../../linux-2.6.22.19,g' ../../toolchain-1.9.2.7-rtn/src/.config
	cp -f ./*-uclibc-*.patch  ../../toolchain-1.9.2.7-rtn/src/toolchain/uClibc/patches/0.9.32/
	patch -p0 -i ./0.9.32-config.patch
	patch -p0 -i ./add-mirror.patch
	patch -p0 -i ./define-toolchain-path.patch
	@echo Compiling toolchain...
	(cd ../../toolchain-1.9.2.7-rtn/src; \
	make V=99)
	@echo Toolchain compilation finished.
	rm -fr ../../toolchain-1.9.2.7-rtn
	touch $@

clean:
	rm -f ./.kernel_prepared
	rm -f ./.kernel_packed
	rm -f ./.toolchain_compiled

.PHONY : clean

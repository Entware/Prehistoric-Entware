#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../.. && pwd -P))
TARCH_NAME=toolchain-$(TARGET)-r$(TOOLCHAIN_REVISION).tgz
include ../config.mk

all: .toolchain_prepared

.toolchain_prepared: \
	    /opt/entware \
	    $(TOP)/downloads/$(TARCH_NAME)
	tar -C /opt/entware -xf $(TOP)/downloads/$(TARCH_NAME)
	@touch $@

ifdef FORCE_COMPILE
$(TOP)/downloads/$(TARCH_NAME): \
	    $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION)
	mkdir -p $(TOP)/toolchain-1.9.2.7-rtn/src
	cp --recursive --update --force $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION)/* $(TOP)/toolchain-1.9.2.7-rtn/src
	cp -f $(TOP)/toolchain-1.9.2.7-rtn/src/defconfig $(TOP)/toolchain-1.9.2.7-rtn/src/.config
	sed -i -e 's|^\(CONFIG_EXTERNAL_KERNEL_TREE\)=.*|\1=\"$(TOP)/linux-2.6.22.19\"|g' $(TOP)/toolchain-1.9.2.7-rtn/src/.config
	sed -i -e 's|^\(CONFIG_DOWNLOAD_FOLDER\)=.*|\1=\"$(TOP)/downloads\"|g' $(TOP)/toolchain-1.9.2.7-rtn/src/.config
	cp -f patches-uclibc/*  $(TOP)/toolchain-1.9.2.7-rtn/src/toolchain/uClibc/patches/0.9.32/
	@for patch in `ls $(CURDIR)/patches-generic/*.patch | sort`; do ( \
	    patch -d $(TOP) -p3 -i $$patch; \
	); done
	@for patch in `ls $(CURDIR)/patches-$(TARGET)/*.patch | sort`; do ( \
	    patch -d $(TOP) -p3 -i $$patch; \
	); done
	@echo Compiling toolchain...
	$(MAKE) -C "$(TOP)/toolchain-1.9.2.7-rtn/src" V=99
	#rm -fr $(TOP)/toolchain-1.9.2.7-rtn
	tar -C /opt/entware -czf $(TOP)/downloads/$(TARCH_NAME) ./toolchain-$(TARGET)
	@echo Toolchain is compiled.
else
$(TOP)/downloads/$(TARCH_NAME): $(TOP)/downloads
	    [ -f $(TOP)/downloads/$(TARCH_NAME) ] || wget $(SRC_MIRROR)/$(TARCH_NAME) \
	    -O $(TOP)/downloads/$(TARCH_NAME)
	@echo Toolchain is downloaded.
endif

$(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION): $(TOP)/downloads
	svn checkout --revision $(TOOLCHAIN_REVISION) http://wl500g.googlecode.com/svn/toolchain $(TOP)/downloads/toolchain-src-r$(TOOLCHAIN_REVISION)

/opt/entware:
	@echo Making /opt/entware directory, root password needed...
	@sudo mkdir -p /opt/entware
	@sudo chmod -R 777 /opt/entware

$(TOP)/downloads:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"

clean:
	@rm -f .toolchain_prepared
	@rm -fr $(TOP)/toolchain-1.9.2.7-rtn

cleanall: clean
	@echo Root access may needed to remove toolchain...
	@sudo rm -fr /opt/entware

.PHONY: clean cleanall all

#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../.. && pwd -P))
ARCH_BITS=$(shell getconf LONG_BIT)
TARCH_NAME=toolchain-x$(ARCH_BITS)-$(TARGET)-$(TOOLCHAIN_COMMIT).tgz
include ../config.mk

all: .toolchain_prepared

.toolchain_prepared: \
	    /opt/entware \
	    $(TOP)/downloads/$(TARCH_NAME)
	tar -C /opt/entware -xf $(TOP)/downloads/$(TARCH_NAME)
	@touch $@

ifdef FORCE_COMPILE
$(TOP)/downloads/$(TARCH_NAME): $(TOP)/downloads/toolchain-src-git
	cp -R $(TOP)/downloads/toolchain-src-git $(TOP)
	cp -f $(TOP)/toolchain-src-git/defconfig $(TOP)/toolchain-src-git/.config
	sed -i -e 's|^\(CONFIG_EXTERNAL_KERNEL_TREE\)=.*|\1=\"$(TOP)/linux-2.6.22.19\"|g' $(TOP)/toolchain-src-git/.config
	sed -i -e 's|^\(CONFIG_DOWNLOAD_FOLDER\)=.*|\1=\"$(TOP)/downloads\"|g' $(TOP)/toolchain-src-git/.config
	cp -f patches-uclibc/*  $(TOP)/toolchain-src-git/toolchain/uClibc/patches/0.9.32/
	@for patch in `ls $(CURDIR)/patches-generic/*.patch | sort`; do ( \
	    patch -d $(TOP) -p3 -i $$patch; \
	); done
	@for patch in `ls $(CURDIR)/patches-$(TARGET)/*.patch | sort`; do ( \
	    patch -d $(TOP) -p3 -i $$patch; \
	); done
	@echo Compiling toolchain...
	$(MAKE) -C "$(TOP)/toolchain-src-git" V=99
	tar -C /opt/entware -czf $(TOP)/downloads/$(TARCH_NAME) ./toolchain-$(TARGET)
	rm -fr $(TOP)/toolchain-src-git
	@echo Toolchain compiled.

$(TOP)/downloads/toolchain-src-git: $(TOP)/downloads
	(if [ -d $(TOP)/downloads/toolchain-src-git ]; then \
	    cd $(TOP)/downloads/toolchain-src-git; \
	    git pull origin master; \
	else \
	    git clone --no-checkout https://github.com/wl500g/toolchain $(TOP)/downloads/toolchain-src-git; \
	fi; \
	cd $(TOP)/downloads/toolchain-src-git; \
	git checkout $(TOOLCHAIN_COMMIT))
else
$(TOP)/downloads/$(TARCH_NAME): $(TOP)/downloads
	    [ -f $(TOP)/downloads/$(TARCH_NAME) ] || wget $(SRC_MIRROR)/$(TARCH_NAME) \
	    -O $(TOP)/downloads/$(TARCH_NAME)
	@echo Toolchain downloaded.
endif

/opt/entware:
	@echo Making /opt/entware directory, root password needed...
	@sudo mkdir -p /opt/entware
	@sudo chmod -R 777 /opt/entware

$(TOP)/downloads:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"

clean:
	@rm -f .toolchain_prepared
	@rm -fr $(TOP)/toolchain-src-git

cleanall: clean
	@echo Root access may needed to remove toolchain...
	@sudo rm -fr /opt/entware

.PHONY: clean cleanall all $(TOP)/downloads/toolchain-src-git

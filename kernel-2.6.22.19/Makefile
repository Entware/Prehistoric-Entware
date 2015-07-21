#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

export TOP?=$(shell (cd ../.. && pwd -P))
ARCH_NAME=kernel-$(KERNEL_COMMIT).tgz
include ../config.mk

all: .kernel_prepared

.kernel_prepared: $(TOP)/downloads/$(ARCH_NAME)
	tar -C $(TOP) -xf $(TOP)/downloads/$(ARCH_NAME)
	@echo Kernel prepared.
	@touch $@

ifdef FORCE_COMPILE
$(TOP)/downloads/$(ARCH_NAME): $(TOP)/downloads/kernel-src-git
	cp -R $(TOP)/downloads/kernel-src-git $(TOP)
	sed -i -e 's|^\(TOOLCHAINDIR\)=.*|\1=$(TOP)|g' $(TOP)/kernel-src-git/gateway/config/defconfig
	$(MAKE) -C "$(TOP)/kernel-src-git/gateway" config
	tar -C $(TOP)/kernel-src-git/linux -czf $(TOP)/downloads/$(ARCH_NAME) ./linux-2.6.22.19
	rm -fr $(TOP)/kernel-src-git

$(TOP)/downloads/kernel-src-git: $(TOP)/downloads
	(if [ -d $(TOP)/downloads/kernel-src-git ]; then \
	    cd $(TOP)/downloads/kernel-src-git; \
	    git pull origin master; \
	else \
	    git clone --no-checkout https://github.com/wl500g/wl500g $(TOP)/downloads/kernel-src-git; \
	fi; \
	cd $(TOP)/downloads/kernel-src-git; \
	git checkout $(KERNEL_COMMIT))
else
$(TOP)/downloads/$(ARCH_NAME): $(TOP)/downloads
	[ -f $(TOP)/downloads/$(ARCH_NAME) ] || wget $(SRC_MIRROR)/$(ARCH_NAME) \
	    -O $(TOP)/downloads/$(ARCH_NAME)
	@echo Kernel downloaded.
endif

$(TOP)/downloads:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"

clean:
	@rm -f .kernel_prepared
	@rm -fr $(TOP)/kernel-src-git

cleanall: clean
	@rm -fr $(TOP)/linux-2.6.22.19

.PHONY: clean cleanall all $(TOP)/downloads/kernel-src-git

#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Makefile for a Entware repository building.
# It creates an OpenWRT packages for using /opt folder on various firmwares.
#

include ./config.mk
export TOP:=$(shell (cd .. && pwd -P))

all: .toolchain_installed .buildroot_installed .packages_compiled

packages_compile: .packages_compiled
.packages_compiled:
	$(MAKE) -C "$(TOP)/openwrt_trunk" tools/compile
	$(MAKE) -C "$(TOP)/openwrt_trunk" tools/install
	@echo Press \"Ctrl + c\" if you don\'t need to compile whole repository...
	$(MAKE) -C "$(TOP)/openwrt_trunk" package/compile
	$(MAKE) -C "$(TOP)/openwrt_trunk" package/index
	@touch $@

packages: packages/.packages_prepared

packages/.packages_prepared:
	$(MAKE) -C packages

buildroot: .buildroot_installed
.buildroot_installed:
	@echo Deploying OpenWRT Buildroot...
	[ -d $(TOP)/downloads ] || mkdir -p $(TOP)/downloads
	if [ -d $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION) ]; then \
		mkdir -p $(TOP)/openwrt_trunk ; \
		cp --recursive --update --force $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION)/* $(TOP)/openwrt_trunk ; \
	else \
		svn co --revision=$(OPENWRT_REVISION) svn://svn.openwrt.org/openwrt/trunk/ $(TOP)/openwrt_trunk ; \
		cp -f ./buildroot/feeds.conf $(TOP)/openwrt_trunk ; \
		(cd $(TOP)/openwrt_trunk ; \
		    for feed in packages routing telephony rtndev ; \
		    do \
			./scripts/feeds update $$feed ; \
			./scripts/feeds install -a -p $$feed ; \
		    done) ; \
		mkdir -p $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION) ; \
		cp --recursive --update --force $(TOP)/openwrt_trunk/* $(TOP)/downloads/openwrt_trunk-r$(OPENWRT_REVISION) ; \
	fi
	ln -sf $(TOP)/downloads $(TOP)/openwrt_trunk/dl
	$(MAKE) -C buildroot
	@touch $@

toolchain: .toolchain_installed
.toolchain_installed:
	[ -d "$(TOP)/downloads" ] || mkdir -p "$(TOP)/downloads"
	$(MAKE) -C toolchain
	@touch $@

define update_git_mirror
	[ -d "$(TOP)/tmp" ] || mkdir "$(TOP)/tmp"
	(cd "$(TOP)/tmp"; \
	    [ -d "$(2)" ] && rm -rf $(2); \
	    git clone $(1); \
	    cd $(2); \
	    git remote add upstream $(3); \
	    git fetch upstream; \
	    git merge upstream/master; \
	    git push origin master; \
	    cd ..; \
	    rm -rf $(2))
endef

update_git_mirrors: .git_mirrors_updated
.git_mirrors_updated:
	$(call update_git_mirror,https://github.com/ryzhovau/openwrt-telephony.git,openwrt-telephony,http://feeds.openwrt.nanl.de/openwrt/telephony.git)
	$(call update_git_mirror,https://github.com/ryzhovau/openwrt-packages.git,openwrt-packages,git://git.openwrt.org/packages.git)
	$(call update_git_mirror,https://github.com/ryzhovau/packages.git,packages,https://github.com/openwrt-routing/packages.git)
	@touch $@

clean:
	$(MAKE) -C packages clean
	$(MAKE) -C buildroot distclean
	$(MAKE) -C toolchain distclean
	@rm -f .buildroot_installed
	@rm -f .toolchain_installed
	@rm -f .packages_compiled
	@rm -f .git_mirrors_updated

.PHONY: clean


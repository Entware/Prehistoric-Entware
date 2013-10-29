#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include config.mk
export TOP:=$(shell (cd .. && pwd -P))

all: .packages_compiled

.packages_compiled: toolchain/$(TARGET)/.toolchain_prepared \
	    buildroot/$(TARGET)/.buildroot_prepared packages/.package_prepared
	$(MAKE) -C "$(TOP)/openwrt_trunk" tools/compile
	$(MAKE) -C "$(TOP)/openwrt_trunk" tools/install
	@echo Press \"Ctrl + c\" if you don\'t need to compile whole repository...
	$(MAKE) -C "$(TOP)/openwrt_trunk" package/compile
	$(MAKE) -C "$(TOP)/openwrt_trunk" package/index
	@touch $@

toolchain/$(TARGET)/.toolchain_prepared:
	$(MAKE) -C "toolchain/$(TARGET)"

packages/.package_prepared:
	$(MAKE) -C "packages"

buildroot/$(TARGET)/.buildroot_prepared:
	$(MAKE) -C "buildroot/$(TARGET)"

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
	$(MAKE) -C buildroot/$(TARGET) clean
	$(MAKE) -C toolchain/$(TARGET) clean
	@rm -f .packages_compiled
	@rm -f .git_mirrors_updated

cleanall:
	$(MAKE) -C buildroot/$(TARGET) cleanall
	$(MAKE) -C toolchain/$(TARGET) cleanall
	@rm -f .packages_compiled
	@rm -f .git_mirrors_updated

.PHONY: clean cleanall all

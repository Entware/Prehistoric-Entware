#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include config.mk
export TOP:=$(shell (cd .. && pwd -P))

all: \
	    kernel-2.6.22.19/.kernel_prepared \
	    toolchain/.toolchain_prepared \
	    buildroot/.buildroot_prepared \
	    packages/.package_prepared
ifeq ($(ARCH),entware)
	$(MAKE) -C switch-arch entware
else ifeq ($(ARCH),mipselsf)
	$(MAKE) -C switch-arch mipselsf
endif
	$(MAKE) -C "$(TOP)/openwrt_trunk" tools/compile
	$(MAKE) -C "$(TOP)/openwrt_trunk" tools/install
	@echo "Buildroot is ready! To recompile the whole repo type:"
	@echo "cd ../openwrt_trunk"
	@echo "make package/compile"
	@echo "See Buildroot Wiki at http://wiki.openwrt.org/about/toolchain for details."

kernel-2.6.22.19/.kernel_prepared:
	$(MAKE) -C "kernel-2.6.22.19"

toolchain/.toolchain_prepared:
	$(MAKE) -C "toolchain"

buildroot/.buildroot_prepared:
	$(MAKE) -C "buildroot"

packages/.package_prepared:
	$(MAKE) -C "packages"

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
	$(call update_git_mirror,https://github.com/Entware/openwrt-packages.git,openwrt-packages,https://github.com/openwrt/packages.git)
	$(call update_git_mirror,https://github.com/Entware/openwrt-routing.git,openwrt-routing,https://github.com/openwrt-routing/packages.git)
	$(call update_git_mirror,https://github.com/Entware/openwrt-telephony.git,openwrt-telephony,http://git.openwrt.org/feed/telephony.git)
	$(call update_git_mirror,https://github.com/Entware/openwrt-management.git,openwrt-management,https://github.com/openwrt-management/packages.git)
	$(call update_git_mirror,https://github.com/Entware/openwrt-oldpackages.git,openwrt-oldpackages,http://git.openwrt.org/packages.git)
	@touch $@

clean:
	$(MAKE) -C kernel-2.6.22.19 clean
	$(MAKE) -C toolchain clean
	$(MAKE) -C buildroot clean
	$(MAKE) -C packages clean
	@rm -f .git_mirrors_updated

cleanall: clean
	$(MAKE) -C kernel-2.6.22.19 cleanall
	$(MAKE) -C toolchain cleanall
	$(MAKE) -C buildroot cleanall

.PHONY: clean cleanall all

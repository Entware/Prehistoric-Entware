#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Makefile for a Entware repository building.
# It creates an OpenWRT packages for using /opt folder on various firmwares.
#

DIR_LIST=$(shell (find -maxdepth 1 -type d ! -name .svn ! -name . | sort))
export TOP?=$(shell (cd ../.. && pwd -P))

define process_folders
	@for dir in $(1); do ( \
	    if [ -e $$dir/Makefile ]; then \
		$(MAKE) -C "$$dir" $(2); \
	    else \
		$(MAKE) -C "$$dir" -f ../Makefile.package PK_NAME="$$dir" $(2); \
	    fi; \
	); done
endef

all: .packages_prepared

.packages_prepared: .packages_path.mk
	@echo Processing OpenWRT packages...
	$(call process_folders,$(DIR_LIST),)
	@echo Done!
	@touch $@

.packages_path.mk:
	@ruby ./index_scan.rb
	@echo "Feeds index processed!"

ifdef MAKECMDGOALS
ifneq ($(strip $(filter-out clean,$(MAKECMDGOALS)))),)
PACKAGE=$(strip $(filter-out clean,$(MAKECMDGOALS)))
$(PACKAGE): .packages_path.mk $(PACKAGE)/.done

$(PACKAGE)/.done:
	$(call process_folders,./$(PACKAGE),)
endif
endif

clean:
	$(call process_folders,$(DIR_LIST),clean)
	@rm -f .packages_path.mk
	@rm -f .packages_prepared

.PHONY: clean all

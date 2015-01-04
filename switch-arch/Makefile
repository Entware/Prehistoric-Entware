#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include ../config.mk
export TOP:=$(shell (cd ../.. && pwd -P))
CFG=$(TOP)/openwrt_trunk/.config

all:
	$(error Choose an arch!)

define delete_arch_defs
	for i in $$(cat arch_defs_strings); do ( \
	    grep -v "$$i" $(CFG) > $(CFG).tmp; \
	    mv $(CFG).tmp $(CFG); \
	); done

endef

mipselsf:
	$(call delete_arch_defs)
	cat arch_defs_mipselsf >> $(CFG)

entware:
	$(call delete_arch_defs)
	cat arch_defs_entware >> $(CFG)

.PHONY: all mipselsf entware

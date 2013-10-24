#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/downgrade-to-r28892.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/packages/admin/zabbix/patches/002-fix-res_send-on-uclibc.patch
	cp -f ./S07zabbix_agentd ../../../openwrt_trunk/feeds/packages/admin/zabbix/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean

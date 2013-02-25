#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./downgrade_from_2.0_to_1.6.patch
	rm ../../../openwrt_trunk/feeds/packages/admin/zabbix/patches/002-fix-res_send-on-uclibc.patch
	patch -p0 -i ./fix-path.patch
	cp ./S07zabbix_agentd ../../../openwrt_trunk/feeds/packages/admin/zabbix/files/
	touch $@

clean:
	rm -f ./.done

.PHONY : clean

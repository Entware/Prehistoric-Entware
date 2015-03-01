#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./S24dansguardian ../../../openwrt_trunk/feeds/packages/net/dansguardian/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean

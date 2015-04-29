#
# Copyright (C) 2011-2015 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	mkdir -p ../../../openwrt_trunk/feeds/oldpackages/net/weechat/patches
	cp -f ./501-python-flags.patch ../../../openwrt_trunk/feeds/oldpackages/net/weechat/patches
	cp -f ./502-perl-flags.patch ../../../openwrt_trunk/feeds/oldpackages/net/weechat/patches
	cp -f ./400-pythonfind.patch ../../../openwrt_trunk/feeds/oldpackages/net/weechat/patches
	@touch $@

clean:
	@rm -f .done

.PHONY: clean

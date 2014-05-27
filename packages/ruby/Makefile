#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./500-OP_MSIE_SSLV2_RSA_PADDING.patch ../../../openwrt_trunk/feeds/packages/lang/ruby/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean

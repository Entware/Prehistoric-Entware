#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	cp -f ./500-ffmpeg_compat2.patch ../../../openwrt_trunk/feeds/oldpackages/libs/libdlna/patches/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean

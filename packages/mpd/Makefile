#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: .done

.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	rm -f ../../../openwrt_trunk/feeds/packages/sound/mpd/patches/*.patch
	cp -f ./100-compile-fixes.patch ../../../openwrt_trunk/feeds/packages/sound/mpd/patches/
	cp -f ./200-allow-float-samples-ffmpeg.patch ../../../openwrt_trunk/feeds/packages/sound/mpd/patches/
	cp -f ./210-support_raw_pcm_streams.patch ../../../openwrt_trunk/feeds/packages/sound/mpd/patches/	
	cp -f ./300-ffmpeg_fix.patch ../../../openwrt_trunk/feeds/packages/sound/mpd/patches/
	cp -f ./S89mpd ../../../openwrt_trunk/feeds/packages/sound/mpd/files/
	@touch $@

clean:
	@rm -f .done

.PHONY: clean

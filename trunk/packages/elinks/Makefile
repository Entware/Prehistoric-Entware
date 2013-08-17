#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/libidn.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/TEMP-bump-to-0.12pre6.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean

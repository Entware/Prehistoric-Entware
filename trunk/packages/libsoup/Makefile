#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -d $(TOP) -p3 -i $(CURDIR)/downgrade_from_2.38.1_to_2.28.2.patch
	patch -d $(TOP) -p3 -i $(CURDIR)/fix-path.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean

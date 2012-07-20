#
# Copyright (C) 2011-2012 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	patch -p0 -i ./bump-to-2.5.2.patch
	touch $@

clean:
	rm -f ./.done

.PHONY : clean

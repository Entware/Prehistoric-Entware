#
# Copyright (C) 2011-2013 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

all: ./.done

./.done:
	@for php_patch in `ls -1 ./fix-path-*.patch`; do ( \
		patch -p0 -i $$php_patch; \
	); done
	touch $@

clean:
	rm -f ./.done

.PHONY : clean

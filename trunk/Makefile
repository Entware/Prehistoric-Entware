# Makefile for OpenWrt Buildroot. It fixes buildroot and its packages for using on Asus RT-Nxx with wl500g.googlecode.com firmware
#
# Copyright (C) 2011 Ryzhov Alexander
# 
# This is free software, licensed under the GNU General Public License v2.
#


all: ./.done

./.done:
	@echo Processing OpenWRT Buildroot...
	@for dir in `ls ./fixes`; do ( \
	    echo Processing "$$dir"; \
	    make -C "./fixes/$$dir"; \
	); done
	@echo Done!
	touch $@

ipk_index: ./.ipk_indexed
./.ipk_indexed:
	rm -f ../trunk/bin/rtn/packages/Packages ../trunk/bin/rtn/packages/Packages.gz
	(cd ../trunk/bin/rtn/packages; \
	../../../scripts/ipkg-make-index.sh . > ./Packages; \
	gzip -c ./Packages > ./Packages.gz)
	touch $@

clean:
	@for dir in `ls ./fixes`; do ( \
	    rm -f -v ./fixes/$$dir/.done \
	); done
	rm -f ./.ipk_indexed
	rm -f ./.done

.PHONY : clean
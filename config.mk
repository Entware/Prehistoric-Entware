#
# Copyright (C) 2011-2014 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

#
# It is better to have a slightly different openwrt revisions for qnapware and entware
# It is done in case one uses common download dir for both.
# This will make downloads/openwrt_trunk_r<revision> dirs different for repositories
#
export OPENWRT_REVISION=43719

# Target architecture for repo (now only x86 is supported)
export TARGET=x86
#export TARGET=arm

# Mirror for sources
SRC_MIRROR=http://qnapware.zyxmon.org/sources

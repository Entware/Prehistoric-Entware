#!/bin/sh

cd ..
[ -d "./tmp" ] || mkdir ./tmp
cd ./tmp

[ -d "./openwrt-telephony" ] && rm -rf ./openwrt-telephony
git clone https://github.com/ryzhovau/openwrt-telephony.git
cd ./openwrt-telephony/
git remote add upstream http://feeds.openwrt.nanl.de/openwrt/telephony.git
git fetch upstream 
git merge upstream/master
git push origin master
cd ..


[ -d "./openwrt-packages" ] && rm -rf ./openwrt-packages
git clone https://github.com/ryzhovau/openwrt-packages.git
cd ./openwrt-packages/
git remote add upstream git://git.openwrt.org/packages.git
git fetch upstream 
git merge upstream/master
git push origin master
cd ..

[ -d "./packages" ] && rm -rf ./packages
git clone https://github.com/ryzhovau/packages.git
cd ./packages/
git remote add upstream https://github.com/openwrt-routing/packages.git
git fetch upstream 
git merge upstream/master
git push origin master
cd ..

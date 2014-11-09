# Description

Entware is package repository for embedded devices. [These packages](http://entware.wl500g.info/binaries/entware/Packages.html) allow you to add new functionality to your device. Most of them taken from OpenWRT, but others are unique. It's usable by router firmwares such as DD-WRT/Tomato/AsusWRT, by Realtek RTD1073/1283/1185/1186 based players, and so on. 

# Getting started

[Prepare USB drive](https://github.com/Entware/entware/wiki/USB-Storage-setup), or other storage, and type:

Soft-float ( Works with both soft-float & hard-float firmwares. )
```
wget -O - http://entware.wl500g.info/binaries/mipselsf/installer/entware_install.sh | sh
```
Hard-float ( Works only with hard-float firmwares. )
```
wget -O - http://entware.wl500g.info/binaries/entware/installer/entware_install.sh | sh
```
A basic packages will be deployed. See [available packages](http://entware.wl500g.info/binaries/entware/Packages.html):
```
opkg list
```
Install desired ones:
```
opkg install mc
```
See other OPKG commands [here](http://wiki.openwrt.org/doc/techref/opkg).

# Getting more help

* See (and fill) [Wiki pages](https://github.com/Entware/entware/wiki/_pages),
* Ask new packages or report about bugs on [Issues](https://github.com/Entware/entware/issues),
* Discuss Entware on http://wl500g.info/forum.php.

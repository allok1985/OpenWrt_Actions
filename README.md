# Actions-OpenWrt

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/allok1985/Actions-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/allok1985/Actions-OpenWrt.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/allok1985/Actions-OpenWrt.svg?style=flat-square&label=Forks&logo=github)

sysupgrade -v /opt/openwrt-x86-64-generic-squashfs-combined.img

git clone https://github.com/coolsnowwolf/lede

cd lede

./scripts/feeds update -a

./scripts/feeds install -a

make menuconfig

git pull

./scripts/feeds update -a && ./scripts/feeds install -a

make download -j8

make V=s -j1

Build OpenWrt using GitHub Actions

感谢P3TERX/Actions-OpenWrt提供的工具源码。

[Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


# Actions-OpenWrt

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/allok1985/OpenWrt_Actions/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/allok1985/OpenWrt_Actions.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/allok1985/OpenWrt_Actions.svg?style=flat-square&label=Forks&logo=github)


## 升级

- 支持自动升级  服务/简易更新
- 手动更新
- wget -P /tmp https://github.com/allok1985/OpenWrt_Actions/releases/latest/download/openwrt-x86-64-generic-squashfs-combined.img.gz
- sysupgrade -v /tmp/openwrt-x86-64-generic-squashfs-combined.img.gz

## 编译

- git clone https://github.com/coolsnowwolf/lede
- cd lede
- git pull
- ./scripts/feeds update -a && ./scripts/feeds install -a
- make menuconfig
- make download -j8
- make V=s -j1


## 教程
Build OpenWrt using GitHub Actions

感谢P3TERX/Actions-OpenWrt提供的工具源码。

[Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#rm -rf ./package/lean/luci-app-n2n_v2
#rm -rf ./package/lean/n2n_v2

#Lienol大神
#echo 'src-git lienol https://github.com/Lienol/openwrt-package.git;main' >>feeds.conf.default
#kenzok8
#echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default
#echo 'src-git kenzok8 https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
#echo 'src-git small8 https://github.com/kenzok8/small-package' >>feeds.conf.default
#n2n_v2s
#echo 'src-git n2nv2s https://github.com/allok1985/n2n_v2s.git' >>feeds.conf.default
#翻墙
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git OpenClash https://github.com/vernesong/OpenClash' >>feeds.conf.default
#echo 'rc-git passwall https://github.com/xiaorouji/openwrt-passwall.git' >>feeds.conf.default
#echo 'src-git vssr https://github.com/jerrykuku/luci-app-vssr' >>feeds.conf.default
#DNS
#echo 'src-git smartdns https://github.com/pymumu/smartdns.git' >>feeds.conf.default
#echo 'src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' >>feeds.conf.default
#dockerman
#echo 'src-git dockerman https://github.com/lisaac/luci-app-dockerman' >>feeds.conf.default
#AXS
#echo 'src-git filebrowser https://github.com/immortalwrt/openwrt-filebrowser' >>feeds.conf.default
#echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon' >>feeds.conf.default
#echo 'src-git argonc https://github.com/jerrykuku/luci-app-argon-config' >>feeds.conf.default
#luci-lib-ipkg空包  argon主题？
#echo 'src-git opipkg https://github.com/xiangfeidexiaohuo/op-ipkg' >>feeds.conf.default
#echo 'src-git istore https://github.com/linkease/istore' >>feeds.conf.default
#echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >>feeds.conf.default
#echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >>feeds.conf.default


#来源https://github.com/allok1985/openwrt-Exclusive/blob/main/diy5.15.sh
#============================================================
#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile
# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# sed -i '$a src-git bypass https://github.com/garypang13/openwrt-bypass' feeds.conf.default
# mv -vf ../mt7621_phicomm_k2p.dts ./target/linux/ramips/dts/mt7621_phicomm_k2p.dts
#　git clone https://github.com/vernesong/OpenClash.git package/OpenClash
#svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
#svn co https://github.com/linkease/istore/trunk/luci/luci-app-store package/luci-app-store
sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-store/Makefile
#svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
#git clone https://github.com/QiuSimons/openwrt-mos.git package/openwrt-mos
#git clone https://github.com/sbwml/openwrt-alist.git package/openwrt-alist
#git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
# git clone https://github.com/kiddin9/openwrt-bypass.git package/openwrt-bypass
#git clone https://github.com/fw876/helloworld.git package/ssr
#git clone https://github.com/firker/diy-ziyong.git package/diy-ziyong
#git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
#git clone -b luci https://github.com/xiaorouji/openwrt-passwall package/passwall
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon-18.06
#git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
#git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
#git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
#git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc
# git clone https://github.com/yichya/luci-app-xray.git package/luci-app-xray

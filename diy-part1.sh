#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds/放在更新feeds之前)
#

#修改添加feeds源
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# sed -i "s/src-git/src-git-full/g" feeds.conf.default
# echo 'src-git helloworld https://github.com/fw876/helloworld.git' >> feeds.conf.default
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '11i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '12i src-git small https://github.com/kenzok8/small' feeds.conf.default
# sed -i '13i src-git haiibo https://github.com/haiibo/openwrt-packages.git' feeds.conf.default
sed -i '14i src-git themeargone https://github.com/kenzok78/luci-theme-argone' feeds.conf.default
# sed -i '15i src-git lienol https://github.com/Lienol/openwrt-package.git;main' feeds.conf.default
# sed -i '16i src-git ziyong https://github.com/firker/diy-ziyong.git' feeds.conf.default
sed -i '17i src-git siropboy https://github.com/sirpdboy/sirpdboy-package.git' feeds.conf.default
# sed -i '18i src-git sundaqiang https://github.com/sundaqiang/openwrt-packages.git' feeds.conf.default
sed -i '19i src-git sundaqiangbak https://github.com/allok1985/sundaqiang-openwrt-packages' feeds.conf.default
# sed -i '20i kiddin9 https://github.com/kiddin9/openwrt-packages.git' feeds.conf.default
# sed -i '21i Hyy2001X https://github.com/Hyy2001X/AutoBuild-Packages.git' feeds.conf.default
#kenzo 库冲突大佬处理1_https://github.com/kenzok8/small/issues/148
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns && rm -rf feeds/packages/net/{alist,adguardhome,mosdns,smartdns}
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#kenzo 库冲突大佬处理2_https://github.com/kenzok8/small-package
#rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}

# Psswall&SSRP插件防炸上游备份-sbwml / kenzo-small的备用
# 移除 openwrt feeds 自带的核心包
# rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# git clone https://github.com/sbwml/openwrt_helloworld package/helloworld
# 更新 golang 1.22 版本
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

#feeds源转diy
#src-git smpackage https://github.com/kenzok8/small-package
#src-git kenzo https://github.com/kenzok8/openwrt-packages
#ssrc-git small https://github.com/kenzok8/small
#src-git haiibo https://github.com/haiibo/openwrt-packages.git
#src-git lienol https://github.com/Lienol/openwrt-package.git;main
#src-git ziyong https://github.com/firker/diy-ziyong.git
src-git siropboy https://github.com/sirpdboy/sirpdboy-package.git
#src-git sundaqiang https://github.com/sundaqiang/openwrt-packages.git
src-git sundaqiangbak https://github.com/allok1985/sundaqiang-openwrt-packages
#src-git kiddin9 https://github.com/kiddin9/openwrt-packages.git
#src-git Hyy2001X https://github.com/Hyy2001X/AutoBuild-Packages.git

#翻墙
#src-git helloworld https://github.com/fw876/helloworld
#src-git OpenClash https://github.com/vernesong/OpenClash
#src-git passwall https://github.com/xiaorouji/openwrt-passwall.git
#src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git
#src-git vssr https://github.com/jerrykuku/luci-app-vssr
#--
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
# sed -i '$a src-git OpenClash https://github.com/vernesong/OpenClash' feeds.conf.default
# sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default
# sed -i '$a src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' feeds.conf.default
# sed -i '$a src-git vssr https://github.com/jerrykuku/luci-app-vssr' feeds.conf.default


#示例https://github.com/ywt114/OpenWrt/blob/main/diy-part1.sh
# Add a feed source
# mv -vf ../mt7621_phicomm_k2p.dts ./target/linux/ramips/dts/mt7621_phicomm_k2p.dts
#　git clone https://github.com/vernesong/OpenClash.git package/OpenClash
#svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
#svn co https://github.com/linkease/istore/trunk/luci/luci-app-store package/luci-app-store
#sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-store/Makefile
#svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
#git clone https://github.com/QiuSimons/openwrt-mos.git package/openwrt-mos
#git clone https://github.com/sbwml/openwrt-alist.git package/openwrt-alist
#git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
# git clone https://github.com/kiddin9/openwrt-bypass.git package/openwrt-bypass
# git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc
# git clone https://github.com/yichya/luci-app-xray.git package/luci-app-xray

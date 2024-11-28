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

##############################################################################################

#修改添加feeds源
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# sed -i "s/src-git/src-git-full/g" feeds.conf.default
# jerryk老竭力旧版本
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# lienol
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# kenzok8软件仓库/smpackage 常用OpenWrt软件包源码合集，同步上游更新/openwrt-packages openwrt常用软件包/small ssr passwall homeprxoy及依赖
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
# 包含网络速度/定时设置/lucky大吉/一键扩容/网络设置向导
sed -i '$a src-git siropboy https://github.com/sirpdboy/sirpdboy-package.git' feeds.conf.default
# sed -i '$a src-git haiibo https://github.com/haiibo/openwrt-packages.git' feeds.conf.default
# 较多主题及插件合集
# sed -i '$a src-git ziyong https://github.com/firker/diy-ziyong.git' feeds.conf.default
# sundaqiang自制的openwrt插件/简易更新/Nginx管理器/进程管理器/网络唤醒++
sed -i '$a src-git sundaqiang https://github.com/sundaqiang/openwrt-packages.git' feeds.conf.default
# sed -i '$a src-git sundaqiangbak https://github.com/allok1985/sundaqiang-openwrt-packages' feeds.conf.default
# sed -i '$a kiddin9 https://github.com/kiddin9/openwrt-packages.git' feeds.conf.default
# sed -i '20i Hyy2001X https://github.com/Hyy2001X/AutoBuild-Packages.git' feeds.conf.default
sed -i '$a src-git NueXini https://github.com/NueXini/NueXini_Packages' feeds.conf.default

##############################################################################################

# 翻墙
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
# sed -i '$a src-git OpenClash https://github.com/vernesong/OpenClash' feeds.conf.default
# sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default
# sed -i '$a src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' feeds.conf.default
# sed -i '$a src-git vssr https://github.com/jerrykuku/luci-app-vssr' feeds.conf.default
sed -i '$a src-git v2rayA https://github.com/v2rayA/v2raya-openwrt' feeds.conf.default
#sed -i '$a src-git nekobox https://github.com/Thaolga/openwrt-nekobox' feeds.conf.default
# DNS
# sed -i '$a src-git smartdns https://github.com/pymumu/smartdns.git' feeds.conf.default
# sed -i '$a src-git lucismartdns https://github.com/pymumu/luci-app-smartdns' feeds.conf.default
# sed -i '$a src-git adguardhome https://github.com/kongfl888/luci-app-adguardhome' feeds.conf.default
# dockerman
sed -i '$a src-git dockerman https://github.com/lisaac/luci-app-dockerman.git;master' feeds.conf.default
#filebrowser
# sed -i '$a src-git filebrowser https://github.com/immortalwrt/openwrt-filebrowser.git;master' feeds.conf.default
# 信息推送
# sed -i '$a src-git serverchan https://github.com/tty228/luci-app-serverchan.git' feeds.conf.default
#sirpdboy动态域名、代理
# sed -i '$a src-git lucky https://github.com/firkerword/luci-app-lucky.git' feeds.conf.default
# 自动更新
sed -i '$a src-git romupdate https://github.com/Blueplanet20120/luci-app-romupdate.git' feeds.conf.default
# 关机
sed -i '$a src-git poweroff https://github.com/esirplayground/luci-app-poweroff.git' feeds.conf.default
# 易有云
# sed -i '$a src-git istore https://github.com/linkease/istore' feeds.conf.default
# sed -i '$a src-git istore_packages https://github.com/linkease/istore-packages.git;main' feeds.conf.default
sed -i '$a src-git nas https://github.com/linkease/nas-packages.git;master' feeds.conf.default
sed -i '$a src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' feeds.conf.default
# 主题
# sed -i '$a src-git themeneobird https://github.com/thinktip/luci-theme-neobird.git' feeds.conf.default
# sed -i '$a src-git themeopentopd https://github.com/sirpdboy/luci-theme-opentopd.git' feeds.conf.default
# sed -i '$a src-git themeargon https://github.com/jerrykuku/luci-theme-argon.git' feeds.conf.default
# sed -i '$a src-git themeargonc https://github.com/jerrykuku/luci-app-argon-config.git' feeds.conf.default
sed -i '$a src-git themekucat https://github.com/sirpdboy/luci-theme-kucat.git' feeds.conf.default
# sed -i '$a src-git themeargone https://github.com/kenzok78/luci-theme-argone' feeds.conf.default
# sed -i '$a src-git themeargonec https://github.com/kenzok78/luci-app-argone-config' feeds.conf.default
sed -i '$a src-git themeinfinityfreedom https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom' feeds.conf.default
# 测速
sed -i '$a src-git netspeedtest https://github.com/sirpdboy/netspeedtest.git' feeds.conf.default
# 分区扩容
# sed -i '$a src-git partexp https://github.com/sirpdboy/luci-app-partexp.git' feeds.conf.default
# tailscale
# sed -i '$a src-git tailscale https://github.com/Carseason/openwrt-tailscale' feeds.conf.default
# 5G模块支持
sed -i '$a src-git 5gmodem https://github.com/Siriling/5G-Modem-Support' feeds.conf.default
# 流量统计
sed -i '$a src-git bandwidthd https://github.com/AlexZhuo/luci-app-bandwidthd' feeds.conf.default
# 应用程序过滤器
sed -i '$a src-git OpenAppFilter https://github.com/destan19/OpenAppFilter' feeds.conf.default
# iKoolProxy是基于KoolProxyR广告过滤
sed -i '$a src-git ikoolproxy https://github.com/ilxp/luci-app-ikoolproxy' feeds.conf.default

##############################################################################################

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}
# 添加额外插件 https://github.com/haiibo/OpenWrt/blob/main/diy-script.sh
# git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
# git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan
# git clone --depth=1 https://github.com/ilxp/luci-app-ikoolproxy package/luci-app-ikoolproxy
# git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
# git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
# git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
# git_sparse_clone main https://github.com/Lienol/openwrt-package luci-app-filebrowser luci-app-ssr-mudb-server
# git_sparse_clone openwrt-18.06 https://github.com/immortalwrt/luci applications/luci-app-eqos
# git_sparse_clone master https://github.com/syb999/openwrt-19.07.1 package/network/services/msd_lite

##############################################################################################

### 插件报错修复
# 翻墙Psswall&SSRP插件防炸上游备份-sbwml / kenzo-small的备用
# 移除 openwrt feeds 自带的核心包
# rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# git clone https://github.com/sbwml/openwrt_helloworld package/helloworld
# 更新 golang 1.22 版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
#kenzo 库冲突大佬处理1_https://github.com/kenzok8/small/issues/148
# ./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns && rm -rf feeds/packages/net/{alist,adguardhome,mosdns,smartdns}
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#kenzo 库冲突大佬处理2_https://github.com/kenzok8/small-package
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
rm -rf package/feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
#kenzo 库syncthing报错 20241107换源
#rm -rf feeds/smpackage/luci-app-syncthing
#git clone https://github.com/Turing-China/luci-app-syncthing feeds/smpackage/luci-app-syncthing
# 20241120 miniupnpd报错
# rm -rf package/feeds/packages/{miniupnpd,miniupnpd-iptables}
#package/feeds/smpackage/luci-app-godproxy failed to build.
rm -rf feeds/smpackage/luci-app-godproxy
rm -rf package/feeds/smpackage/luci-app-godproxy

##############################################################################################

#示例https://github.com/ywt114/OpenWrt/blob/main/diy-part1.sh
# https://github.com/haiibo/OpenWrt/blob/main/diy-script.sh
# Add a feed source
# mv -vf ../mt7621_phicomm_k2p.dts ./target/linux/ramips/dts/mt7621_phicomm_k2p.dts
#　git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# svn co https://github.com/linkease/istore/trunk/luci/luci-app-store package/luci-app-store
# sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-store/Makefile
# svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
# git clone https://github.com/QiuSimons/openwrt-mos.git package/openwrt-mos
# git clone https://github.com/sbwml/openwrt-alist.git package/openwrt-alist
# git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
# git clone https://github.com/kiddin9/openwrt-bypass.git package/openwrt-bypass
# git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc
# git clone https://github.com/yichya/luci-app-xray.git package/luci-app-xray

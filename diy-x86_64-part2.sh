#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds/放在安装feeds之后)
#

# 修改管理地址
# sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 强制切换内核版本5.10/5.15/5.4/6.1
# sed -i "s/KERNEL_PATCHVER:=*.*/KERNEL_PATCHVER:=6.1/g" target/linux/x86/Makefile
# sed -i "s/KERNEL_TESTING_PATCHVER:=*.*/KERNEL_TESTING_PATCHVER:=6.1/g" target/linux/x86/Makefile

# 交换LAN/WAN口
# sed -i 's/"eth1 eth2" "eth0"/"eth1 eth2" "eth0"/g' target/linux/x86/base-files/etc/board.d/02_network
# sed -i "s/'eth1 eth2' 'eth0'/'eth1 eth2' 'eth0'/g" target/linux/x86/base-files/etc/board.d/02_network
# sed -i "s/lan 'eth0'/lan 'eth0'/g" package/base-files/files/etc/board.d/99-default_network
# sed -i "s/wan 'eth1'/wan 'eth1'/g" package/base-files/files/etc/board.d/99-default_network
# sed -i "s/net\/eth1/net\/eth1/g" package/base-files/files/etc/board.d/99-default_network

# 修改默认皮肤luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile
sed -i 's/luci-static\/bootstrap/luci-static\/argon/g'  feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/luci-static\/design/luci-static\/argon/g'  feeds/luci/modules/luci-base/root/etc/config/luci
#取消bootstrap为默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

#sed -i 's/bootstrap/argone/g' ./feeds/luci/modules/luci-base/root/etc/config/luci
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
# 编译多主题时,设置固件默认主题（可自行修改您要的,主题名称必须对,比如下面代码的[argon],和肯定编译了该主题,要不然进不了后台）
#sed -i "/exit 0/i\uci set luci.main.mediaurlbase='/luci-static/argon' && uci commit luci" "$FIN_PATH"
# Add luci-theme-argon
#if [ ! -d "./package/lean/luci-theme-argon" ]; then git clone https://github.com/jerrykuku/luci-theme-argon.git ./package/lean/luci-theme-argon;   else cd ./package/lean/luci-theme-argon; git stash; git stash drop; git pull; cd ..; cd ..; cd ..; fi;
#if [ ! -d "./package/lean/luci-app-argon-config" ]; then git clone https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config;   else cd ./package/lean/luci-app-argon-config; git stash; git stash drop; git pull; cd ..; cd ..; cd ..; fi;



# 修改主机名以及一些显示信息
#sed -i "s/hostname='*.*'/hostname='OpenWrt'/" package/base-files/files/bin/config_generate
#sed -i "s/DISTRIB_ID='*.*'/DISTRIB_ID='OpenWrt'/g" package/base-files/files/etc/openwrt_release
#sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt'/g"  package/base-files/files/etc/openwrt_release
#sed -i '/(<%=pcdata(ver.luciversion)%>)/a\      built by ywt114' package/lean/autocore/files/x86/index.htm
#echo -n "$(date +'%Y%m%d')" > package/base-files/files/etc/openwrt_version

# 修改部分默认设置
#sed -i "/exit 0/i sed -i '\/oui\/d' \/etc\/opkg\/distfeeds.conf" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/option check_signature/# option check_signature/g" package/system/opkg/Makefile
# echo "src/gz openwrt_kiddin9 https://op.supes.top/packages/x86_64" >> package/system/opkg/files/customfeeds.conf
#echo "src/gz openwrt_kenzok8 https://op.dllkids.xyz/packages/x86_64" >> package/system/opkg/files/customfeeds.conf
#sed -i "s/mirrors.cloud.tencent.com\/lede/mirrors.cloud.tencent.com\/openwrt/g" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/sed -i 's\/root::0:0:99999:7:::/# sed -i 's\/root::0:0:99999:7:::/g" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/sed -i 's\/root:::0:99999:7:::/# sed -i 's\/root:::0:99999:7:::/g" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/sed -i '\/REDIRECT --to-ports/# sed -i '\/REDIRECT --to-ports/g" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/echo 'iptables -t/echo '# iptables -t/g" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/echo '\[ -n/echo '# \[ -n/g" package/lean/default-settings/files/zzz-default-settings

# 开启wifi选项
#sed -i 's/disabled=*.*/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/ssid=*.*/ssid=OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 添加关机按钮到系统选项
#curl -fsSL https://raw.githubusercontent.com/ywt114/poweroff/main/poweroff.htm > feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm
#curl -fsSL https://raw.githubusercontent.com/ywt114/poweroff/main/system.lua > feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

# 删除替换默认源插件和添加插件
#hostapd编译错误更换原版https://github.com/coolsnowwolf/lede/pull/11572#issuecomment-1750608547
#\rm -rf package/network/services/hostapd
#svn co https://github.com/openwrt/openwrt/trunk/package/network/services/hostapd package/network/services/hostapd

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

#
#https://github.com/kenzok8/small/issues/148#issuecomment-1999543382
#sed -i 's#GO_PKG_TARGET_VARS.*# #g' feeds/packages/utils/v2dat/Makefile

#git clone https://github.com/sbwml/luci-app-alist package/lean/op-alist
#\cp -rf package/lean/op-alist/alist package/lean/alist
#\cp -rf package/lean/op-alist/luci-app-alist package/lean/luci-app-alist
#\rm -rf package/lean/op-alist
#\rm -rf feeds/packages/net/smartdns
#\rm -rf feeds/luci/applications/luci-app-smartdns
#git clone https://github.com/pymumu/openwrt-smartdns feeds/packages/net/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns package/lean/luci-app-smartdns
#git clone https://github.com/kenzok8/small package/lean/small
#\rm -rf package/lean/small/luci-app-bypass
#\rm -rf package/lean/small/luci-app-vssr
#\rm -rf package/lean/small/luci-app-passwall2
#\rm -rf feeds/packages/net/adguardhome
#\rm -rf feeds/luci/applications/luci-app-adguardhome
#\rm -rf feeds/packages/net/mosdns
#\rm -rf feeds/luci/applications/luci-app-mosdns
#\rm -rf feeds/packages/utils/v2dat
#git clone https://github.com/kenzok8/openwrt-packages package/lean/openwrt-packages
#\cp -rf package/lean/openwrt-packages/luci-app-openclash package/lean/small/luci-app-openclash
#\cp -rf package/lean/openwrt-packages/adguardhome feeds/packages/net/adguardhome
#\cp -rf package/lean/openwrt-packages/luci-app-adguardhome package/lean/luci-app-adguardhome
#\cp -rf package/lean/openwrt-packages/mosdns feeds/packages/net/mosdns
#\cp -rf package/lean/openwrt-packages/luci-app-mosdns package/lean/luci-app-mosdns
#\cp -rf package/lean/openwrt-packages/v2dat feeds/packages/utils/v2dat
#\rm -rf package/lean/openwrt-packages
#\rm -rf feeds/packages/net/socat
#\rm -rf feeds/luci/applications/luci-app-socat
#git clone https://github.com/xiangfeidexiaohuo/openwrt-packages package/lean/openwrt-packages
#\cp -rf package/lean/openwrt-packages/op-socat/socat feeds/packages/net/socat
#\cp -rf package/lean/openwrt-packages/op-socat/luci-app-socat package/lean/luci-app-socat
#\cp -rf package/lean/openwrt-packages/op-homebox/homebox package/lean/homebox
#\cp -rf package/lean/openwrt-packages/op-homebox/luci-app-homebox package/lean/luci-app-homebox
#\rm -rf package/lean/openwrt-packages
#git clone https://github.com/sirpdboy/chatgpt-web package/lean/luci-app-chatgpt
#git clone https://github.com/sirpdboy/luci-app-autotimeset package/lean/luci-app-autotimeset
#sed -i 's/control"/system"/g' package/lean/luci-app-autotimeset/luasrc/controller/autotimeset.lua
#sed -i 's/control]/system]/g' package/lean/luci-app-autotimeset/luasrc/view/autotimeset/log.htm
#git clone https://github.com/linkease/istore package/lean/istore
# sed -i 's/+luci-lib-ipkg/+luci-base/g' package/lean/istore/luci/luci-app-store/Makefile
#\cp -rf package/lean/istore/luci package/lean
#\cp -rf package/lean/istore/translations package/lean
#\rm -rf package/lean/istore
#git clone https://github.com/linkease/nas-packages-luci package/lean/nas-packages-luci
#\cp -rf package/lean/nas-packages-luci/luci/* package/lean/luci
#\rm -rf package/lean/nas-packages-luci
#git clone https://github.com/linkease/nas-packages package/lean/nas-packages
#\cp -rf package/lean/nas-packages/network/services/* package/network/services
#\cp -rf package/lean/nas-packages/multimedia package
#\rm -rf package/lean/nas-packages
#git clone https://github.com/ywt114/luci-app-advanced package/lean/luci-app-advanced
#git clone https://github.com/ywt114/luci-app-gpsysupgrade package/lean/luci-app-gpsysupgrade
#sed -i 's/Variable1 = "*.*"/Variable1 = "ywt114"/g' package/lean/luci-app-gpsysupgrade/luasrc/model/cbi/gpsysupgrade/sysupgrade.lua
#sed -i 's/Variable2 = "*.*"/Variable2 = "OpenWrt"/g' package/lean/luci-app-gpsysupgrade/luasrc/model/cbi/gpsysupgrade/sysupgrade.lua
#sed -i 's/Variable3 = "*.*"/Variable3 = "x86_64_6.1"/g' package/lean/luci-app-gpsysupgrade/luasrc/model/cbi/gpsysupgrade/sysupgrade.lua
#sed -i 's/Variable4 = "*.*"/Variable4 = "6.1"/g' package/lean/luci-app-gpsysupgrade/luasrc/model/cbi/gpsysupgrade/sysupgrade.lua
#sed -i 's/Variable1 = "*.*"/Variable1 = "ywt114"/g' package/lean/luci-app-gpsysupgrade/root/usr/bin/upgrade.lua
#sed -i 's/Variable2 = "*.*"/Variable2 = "OpenWrt"/g' package/lean/luci-app-gpsysupgrade/root/usr/bin/upgrade.lua
#sed -i 's/Variable3 = "*.*"/Variable3 = "x86_64_6.1"/g' package/lean/luci-app-gpsysupgrade/root/usr/bin/upgrade.lua
#sed -i 's/Variable4 = "*.*"/Variable4 = "6.1"/g' package/lean/luci-app-gpsysupgrade/root/usr/bin/upgrade.lua

#files目录权限
#chmod -R 755 files

#修改时区
#sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#设置密码为空
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings
#sed -i '/CYXluq4wUazHjmCDBCqXF/d' "$ZZZ_PATH"


#修改上游DNS
#sed -i "2i # network config" openwrt/package/lean/default-settings/files/zzz-default-settings
#sed -i "3i uci set network.lan.dns='114.114.114.114'"  openwrt/package/lean/default-settings/files/zzz-default-settings

# 取消路由器每天跑分任务
#sed -i "/exit 0/i\sed -i '/coremark/d' /etc/crontabs/root" "$FIN_PATH"

# 在线更新时，删除不想保留固件的某个文件，在EOF跟EOF之间加入删除代码，记住这里对应的是固件的文件路径，比如： rm -rf /etc/config/luci
#cat >$DELETE <<-EOF
#EOF

##############################################################################################

#cat >$NETIP <<-EOF
#uci set network.lan.ipaddr='192.168.2.2'                      # IPv4 地址(openwrt后台地址)
#uci set network.lan.netmask='255.255.255.0'                   # IPv4 子网掩码
#uci set network.lan.gateway='192.168.2.1'                    # 旁路由设置 IPv4 网关（去掉uci前面的#生效）
#uci set network.lan.broadcast='192.168.2.255'                # 旁路由设置 IPv4 广播（去掉uci前面的#生效）
#uci set network.lan.dns='223.5.5.5 114.114.114.114'          # 旁路由设置 DNS(多个DNS要用空格分开)（去掉uci前面的#生效）
#uci set network.lan.delegate='0'                              # 去掉LAN口使用内置的 IPv6 管理(若用IPV6请把'0'改'1')
#uci set dhcp.@dnsmasq[0].filter_aaaa='1'                      # 禁止解析 IPv6 DNS记录(若用IPV6请把'1'改'0')
#uci set dhcp.lan.ignore='1'                                  # 旁路由关闭DHCP功能（去掉uci前面的#生效）
#uci delete network.lan.type                                  # 旁路由去掉桥接模式（去掉uci前面的#生效）
#uci set system.@system[0].hostname='OpenWrt-123'              # 修改主机名称为OpenWrt-123
#uci set ttyd.@ttyd[0].command='/bin/login -f root'           # 设置ttyd免帐号登录（去掉uci前面的#生效）
# 如果有用IPV6的话,可以使用以下命令创建IPV6客户端(LAN口)（去掉全部代码uci前面#号生效）
#uci set network.ipv6=interface
#uci set network.ipv6.proto='dhcpv6'
#uci set network.ipv6.ifname='@lan'
#uci set network.ipv6.reqaddress='try'
#uci set network.ipv6.reqprefix='auto'
#uci set firewall.@zone[0].network='lan ipv6'
#EOF
 
#https://github.com/ywt114/OpenWrt/blob/main/diy-part2_6.1.sh

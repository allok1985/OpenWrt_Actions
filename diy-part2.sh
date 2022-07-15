#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#修改默认的IP
#sed -i 's/192.168.1.1/10.10.10.1/g' openwrt/package/base-files/files/bin/config_generate

#files目录权限
#chmod -R 755 files

#修改主机名
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='Allok_Routes'' openwrt/package/lean/default-settings/files/zzz-default-settings

#设置密码为空
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' openwrt/package/lean/default-settings/files/zzz-default-settings
# 设置首次登录后台密码为空（进入openwrt后自行修改密码）
sed -i '/CYXluq4wUazHjmCDBCqXF/d' "$ZZZ_PATH"

#版本号里显示一个自己的名字
#sed -i "s/OpenWrt /OpenWrt build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/OpenWrt /Allok build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
# 增加个性名字 ${Author} 默认为你的github帐号,修改时候把 ${Author} 替换成你要的
sed -i "s/OpenWrt /Allok compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" "$ZZZ_PATH"
#sed -i "s/OpenWrt /${Author} compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" "$ZZZ_PATH"

#修改上游DNS
#sed -i "2i # network config" openwrt/package/lean/default-settings/files/zzz-default-settings
#sed -i "3i uci set network.lan.dns='114.114.114.114'"  openwrt/package/lean/default-settings/files/zzz-default-settings

# 取消路由器每天跑分任务
#sed -i "/exit 0/i\sed -i '/coremark/d' /etc/crontabs/root" "$FIN_PATH"

# 在线更新时，删除不想保留固件的某个文件，在EOF跟EOF之间加入删除代码，记住这里对应的是固件的文件路径，比如： rm -rf /etc/config/luci
#cat >$DELETE <<-EOF
#EOF

# Mod zzz-default-settings（版本后显示编译日期）
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
popd

# Add luci-theme-argon
rm -rf ../lean/luci-theme-argon
rm -rf ./feeds/luci/luci-theme-argon
rm -rf ./feeds/kenzok8/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-argon
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/kenzok8/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
#git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
sed -i 's/bootstrap/argon/g' ./feeds/luci/collections/luci/Makefile
# 把bootstrap替换成argon为源码必选主题（可自行修改您要的,主题名称必须对,比如下面代码的[argon],源码内必须有该主题,要不然编译失败）
sed -i "s/bootstrap/argon/ig" feeds/luci/collections/luci/Makefile
# 编译多主题时,设置固件默认主题（可自行修改您要的,主题名称必须对,比如下面代码的[argon],和肯定编译了该主题,要不然进不了后台）
sed -i "/exit 0/i\uci set luci.main.mediaurlbase='/luci-static/argon' && uci commit luci" "$FIN_PATH"

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

# 修改插件名字
#sed -i 's/"aMule设置"/"电驴下载"/g' `egrep "aMule设置" -rl ./`
#sed -i 's/"网络存储"/"NAS"/g' `egrep "网络存储" -rl ./`
#sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `egrep "Turbo ACC 网络加速" -rl ./`
#sed -i 's/"KMS 服务器"/"KMS激活"/g' `egrep "KMS 服务器" -rl ./`
#sed -i 's/"终端"/"命令窗"/g' `egrep "终端" -rl ./`
#sed -i 's/"USB 打印服务器"/"打印服务"/g' `egrep "USB 打印服务器" -rl ./`
#sed -i 's/"Web 管理"/"Web管理"/g' `egrep "Web 管理" -rl ./`
#sed -i 's/"管理权"/"改密码"/g' `egrep "管理权" -rl ./`

#修改插件名字
#sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' openwrt/package/lean/luci-app-sfe/po/zh-cn/sfe.po
  

#https://github.com/allok1985/openwrt-Exclusive/blob/main/diy.sh
#============================================================
#sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk
#sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
#sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt VIP99 '/g" ./package/lean/default-settings/files/zzz-default-settings
#sed -i "s/hostname='OpenWrt'/hostname='OpenWrt-SE'/g" ./package/base-files/files/bin/config_generate
# curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.config > ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.config
# curl -fsSL  https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.init > ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.init
# wget https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.config -O ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.config
# wget https://raw.githubusercontent.com/Lienol/openwrt-packages/19.07/net/https-dns-proxy/files/https-dns-proxy.init -O ./feeds/packages/net/https-dns-proxy/files/https-dns-proxy.init
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
# curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# curl -fsSL  https://raw.githubusercontent.com/firkerword/luci-app-bypass/main/Makefile > ./package/luci-app-bypass/Makefile
#curl -fsSL  https://raw.githubusercontent.com/firkerword/KPR/main/cus_config.yaml > ./package/openwrt-mos/luci-app-mosdns/root/etc/mosdns/cus_config.yaml
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# sed -i '60s/ITdesk01/firkerword/' ./package/jd_openwrt_script/files/jd_openwrt_script
#sed -i 's/bootstrap/argon-18.06/g' ./feeds/luci/collections/luci/Makefile

#rm -rf ./feeds/luci/luci-theme-argon
#rm -rf ./feeds/packages/net/adguardhome
#rm -rf ./feeds/packages/net/smartdns
#rm -rf ./feeds/packages/net/mosdns
#rm -rf ./package/openwrt-passwall/v2ray-geodata
#rm -rf ./package/ssr/v2ray-geodata
# svn co https://github.com/garypang13/openwrt-packages/trunk/shadowsocksr-libev package/lean/shadowsocksr-libev
# svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-passwall feeds/passwall/luci-app-passwall
# svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-ssr-plus feeds/helloworld/luci-app-ssr-plus
# svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns feeds/packages/net/smartdns
# svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
# svn co https://github.com/project-openwrt/openwrt/trunk/package/lean/dnsforwarder package/lean/dnsforwarder


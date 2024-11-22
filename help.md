


## 升级

- 支持自动升级  服务/简易更新
- 手动更新
- wget -P /tmp https://github.com/allok1985/OpenWrt_Actions/releases/latest/download/openwrt-x86-64-generic-squashfs-combined.img.gz
- sysupgrade -v /tmp/openwrt-x86-64-generic-squashfs-combined.img.gz

- 修正回默认主题
- vi /etc/config/luci
- i编辑
- config core 'main'
- option mediaurlbase '/luci-static/bootstrap'
- ESC :wq



## 网络配置
- OPENWRT设置之命令行下简单配置有线和无线
- 设置lan ip(即访问路由的ip)
- uci set network.lan.ipaddr=[lan ip]
- uci commit    //应用
- pppoe用户
- uci set network.wan.proto=pppoe    //设置wan口类型为pppoe
- uci set network.wan.username=[上网帐户]
- uci set network.wan.password=[上网密码]    //这两行设置pppoe用户名和密码
- 如果要挂在上级路由下面就这样
- uci set network.wan.proto=none    //关掉wan
- uci set network.lan.gateway=[上级路由ip]    //网关指向上级路由
- uci set network.lan.dns=[上级路由ip]    //dns指向上级路由
- uci set dhcp.lan.ignore=1    //关掉lan的dhcp
- 然后是无线
- uci set wireless.@wifi-device[0].disabled=0    //打开无线
- uci set wireless.@wifi-device[0].txpower=17    //设置功率为17dbm 太高会烧无线模块
- uci set wireless.@wifi-device[0].channel=6    //设置无线信道为6
- uci set wireless.@wifi-iface[0].mode=ap    //设置无线模式为ap
- uci set wireless.@wifi-iface[0].ssid=[自己设置SSID]    //设置无线SSID
- uci set wireless.@wifi-iface[0].network=lan    //无线链接到lan上
- uci set wireless.@wifi-iface[0].encryption=psk2    //设置加密为WPA2-PSK
- uci set wireless.@wifi-iface[0].key=[密码]    //设置无线密码
- 最后应用配置
- uci commit    //应用
- /etc/init.d/network restart    //重启网络服务





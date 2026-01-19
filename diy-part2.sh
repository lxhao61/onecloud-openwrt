#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.254/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/LEDE/OneCloud/g' package/base-files/files/bin/config_generate

# 取消登陆密码
sed -i 's/^\(.*99999\)/#&/' package/lean/default-settings/files/zzz-default-settings

# 替换终端为bash
#sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd

# 移除自带的核心库
rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}
# 拉取 passwall-packages
git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/passwall-packages
#cd package/passwall-packages
#git checkout bc40fceb0488dfb5a4adb711cc1830a8021ee555
#cd -

# 移除过时的 luci 版本
rm -rf feeds/luci/applications/luci-app-passwall
# 拉取 passwall-luci
git clone https://github.com/Openwrt-Passwall/openwrt-passwall.git package/passwall-luci
#cd package/passwall-luci
#git checkout ebd3355bdf2fcaa9e0c43ec0704a8d9d8cf9f658
#cd -

# 删除自带 easytier
rm -rf feeds/packages/net/easytier
rm -rf package/feeds/packages/easytier
# 拉取 easytier、luci-app-easytier
git clone https://github.com/EasyTier/luci-app-easytier.git package/easytier

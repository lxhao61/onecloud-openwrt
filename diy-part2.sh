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
sed -i 's/192.168.1.1/192.168.5.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/LEDE/OneCloud/g' package/base-files/files/bin/config_generate

# 取消登陆密码
sed -i 's/^\(.*99999\)/#&/' package/lean/default-settings/files/zzz-default-settings

# 替换终端为bash
#sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd

# 拉取 easytier、luci-app-easytier
git clone https://github.com/EasyTier/luci-app-easytier.git package/easytier

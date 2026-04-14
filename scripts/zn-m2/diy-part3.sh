#!/bin/bash
set -e

# 修改版本信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt IPQ6000 ZN-M2 Zerotier NOWIFI (build time: $(date +%Y%m%d))'/g" package/base-files/files/etc/openwrt_release

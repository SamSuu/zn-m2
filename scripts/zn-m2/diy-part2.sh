#!/bin/bash
set -e

echo "Pruning unused packages and feeds..."

rm -rf feeds/luci/applications/luci-app-brook-server
rm -rf feeds/luci/applications/luci-app-naiveproxy
rm -rf feeds/luci/applications/luci-app-ssocks
rm -rf feeds/luci/applications/luci-app-ssr-libev-server
rm -rf feeds/luci/applications/luci-app-ssr-plus
rm -rf feeds/luci/applications/luci-app-trojan-server
rm -rf feeds/luci/applications/luci-app-v2ray-server
rm -rf feeds/luci/applications/luci-app-vssr
rm -rf feeds/luci/applications/luci-app-homeproxy
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-mwan3
rm -rf feeds/luci/applications/luci-app-turboacc

rm -rf feeds/packages/net/v2raya
rm -rf feeds/packages/net/brook
rm -rf feeds/packages/net/naiveproxy
rm -rf feeds/packages/net/ssocks
rm -rf feeds/packages/net/trojan
rm -rf feeds/packages/net/xray-core
rm -rf feeds/packages/net/sing-box
rm -rf feeds/packages/net/hysteria
rm -rf feeds/packages/net/chinadns-ng
rm -rf feeds/packages/net/dns2socks
rm -rf feeds/packages/net/dns2tcp
rm -rf feeds/packages/net/ipt2socks
rm -rf feeds/packages/net/microsocks
rm -rf feeds/packages/net/simple-obfs
rm -rf feeds/packages/net/tcping
rm -rf feeds/packages/net/mwan3

echo "Feed prune done."

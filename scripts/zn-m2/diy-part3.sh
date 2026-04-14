#!/bin/bash
set -e

# 版本信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt ZN-M2 4.4 NOWIFI NOUSB Zerotier (build time: $(date +%Y%m%d-%H%M))'/g" package/base-files/files/etc/openwrt_release

# 尽量去掉 target 默认塞进来的 USB 相关包名
find target -type f \( -name "*.mk" -o -name "Makefile" \) -print0 | xargs -0 sed -i \
  -e 's/kmod-usb-core//g' \
  -e 's/kmod-usb2//g' \
  -e 's/kmod-usb3//g' \
  -e 's/kmod-usb-ehci//g' \
  -e 's/kmod-usb-ohci//g' \
  -e 's/kmod-usb-xhci-hcd//g' \
  -e 's/kmod-usb-xhci-plat-hcd//g' \
  -e 's/kmod-usb-dwc3//g' \
  -e 's/kmod-usb-dwc3-of-simple//g' \
  -e 's/kmod-usb-dwc3-qcom//g' \
  -e 's/kmod-usb-phy-qcom-dwc3//g' \
  -e 's/kmod-usb-storage//g' \
  -e 's/kmod-usb-storage-uas//g' \
  -e 's/usbutils//g'

# 给 zerotier 补一个 init 脚本
mkdir -p package/base-files/files/etc/init.d
cat > package/base-files/files/etc/init.d/zerotier <<'EOF'
#!/bin/sh /etc/rc.common
START=95
STOP=10
USE_PROCD=1

PROG=/usr/bin/zerotier-one

start_service() {
    [ -x "$PROG" ] || return 1
    mkdir -p /var/lib/zerotier-one
    procd_open_instance
    procd_set_param command "$PROG"
    procd_set_param respawn
    procd_set_param stdout 1
    procd_set_param stderr 1
    procd_close_instance
}

stop_service() {
    killall zerotier-one 2>/dev/null || true
}
EOF
chmod 0755 package/base-files/files/etc/init.d/zerotier

mkdir -p package/base-files/files/etc/rc.d
ln -sf ../init.d/zerotier package/base-files/files/etc/rc.d/S95zerotier

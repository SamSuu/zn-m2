# zn-m2-op-nowifi

自用 OpenWrt 云编译仓库，面向 **兆能 ZN-M2 / 和目 AX18（IPQ60xx）** 主路由场景。

## 当前方向

- 内核：6.x
- 平台：qualcommax / ipq60xx
- 机型：zn_m2
- 启用：NSS
- 启用：mwan3
- 启用：zerotier
- 禁用：WiFi
- 禁用：USB

## 适用场景

- 弱电箱主路由
- 多 WAN
- Zerotier 节点
- 有线路由
- 低冗余、低发热方案

## 当前基础版包含

- LuCI
- 中文基础界面
- mwan3 / luci-app-mwan3
- zerotier / kmod-tun
- dnsmasq-full
- curl
- htop
- ip-full
- NSS 相关基础包

## 当前基础版不包含

- WiFi 驱动与固件
- hostapd / wpad
- USB 驱动与存储相关包
- PassWall
- sing-box
- xray
- geodata 相关附加包

## 分支说明

当前主要基础分支：

- `zn-m2/basic`

## 构建方式

使用 GitHub Actions 云编译。

主要文件：

- `.github/workflows/zn-m2.yml`
- `configs/zn-m2-basic.config`

## 注意

本仓库更适合已经确认分区方案的 ZN-M2 设备。  
是否可刷，除机型外，还取决于：

- 分区布局
- U-Boot
- 镜像类型
- 当前刷机方式

编译成功不代表一定可直接刷入。

## 免责声明

仅供学习、研究和自用。  
刷机有风险，请自行确认设备型号、分区布局和刷写方式。


控制台地址`192.168.1.1` 默认密码`password`

uboot刷机用`openwrt-ipq60xx-generic-zn_m2-squashfs-nand-factory.ubi`

openwrt系统升级用`openwrt-ipq60xx-generic-zn_m2-squashfs-nand-sysupgrade.bin`

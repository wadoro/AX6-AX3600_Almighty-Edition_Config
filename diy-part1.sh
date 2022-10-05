#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

echo "203.107.6.88 time.android.com" >> package/base-files/files/etc/hosts

#wireless
cat > package/base-files/files/etc/config/wireless <<EOF

config wifi-device 'radio0'
	option type 'mac80211'
	option path 'platform/soc/c000000.wifi'
	option band '5g'
	option country 'US'
	option htmode 'HE160'
	option legacy_rates '1'
	option channel '40'
	option txpower '29'
	option mu_beamformer '1'

config wifi-iface 'default_radio0'
	option device 'radio0'
	option network 'lan'
	option mode 'ap'
	option key 'abc@abcD'
	option ssid '🐥🐥'
	option encryption 'psk-mixed'

config wifi-device 'radio1'
	option type 'mac80211'
	option path 'platform/soc/c000000.wifi+1'
	option band '2g'
	option txpower '25'
	option legacy_rates '1'
	option htmode 'HT40'
	option channel '11'
	option noscan '1'
	option country 'US'
	option mu_beamformer '0'

config wifi-iface 'default_radio1'
	option device 'radio1'
	option network 'lan'
	option mode 'ap'
	option ssid 'ASUS'
	option key 'abc@abcD'
	option encryption 'psk-mixed'

EOF

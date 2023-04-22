#!/bin/sh
sed -i '/thuhollow2_feeds/d' /etc/opkg/customfeeds.conf
echo "src/gz thuhollow2_feeds https://raw.githubusercontent.com/thuhollow2/Openwrt_Packages/main/AXT1800" >>/etc/opkg/customfeeds.conf
opkg update
action="$1"
case "${action}" in
ssr-plus)
	opkg install luci-i18n-base-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg
	;;
passwall)
	opkg install luci-i18n-base-zh-cn luci-app-passwall luci-i18n-passwall-zh-cn luci-compat luci-lib-ipkg
	;;
openclash)
	wget -qO- https://raw.githubusercontent.com/thuhollow2/Install-Openclash-for-Axt1800/main/install_clash.sh | sh
	;;
*)
	opkg install luci-i18n-base-zh-cn luci-app-passwall luci-i18n-passwall-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn luci-compat luci-lib-ipkg
	wget -qO- https://raw.githubusercontent.com/thuhollow2/Install-Openclash-for-Axt1800/main/install_clash.sh | sh
	;;
esac
sed -i '/thuhollow2_feeds/d' /etc/opkg/customfeeds.conf
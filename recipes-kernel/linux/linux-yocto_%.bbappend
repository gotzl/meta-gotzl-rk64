FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
	file://iotop.cfg \
	file://dmcrypt.cfg \
	file://nfs.cfg \
	file://wireguard.cfg \
	file://nftables.cfg \
        file://wifi_dongle.cfg \
"

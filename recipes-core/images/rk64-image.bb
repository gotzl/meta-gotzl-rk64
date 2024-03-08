DESCRIPTION = "RockPro64 base image."
LICENSE = "MIT"

IMAGE_FEATURES += "\
	read-only-rootfs \
	package-management \
	ssh-server-openssh \
	nfs-client \
	nfs-server \
"

APPEND += "cfg80211.ieee80211_regdom=DE"

RRSYNC_DEPS = "perl-module-socket perl-module-io-socket perl-module-file-glob"

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} ${MACHINE_EXTRA_RRECOMMENDS} \
	bitcoin bitcoin-exporter monero monerod-exporter lighthouse-bin \
	nftables dnsmasq python3-fail2ban wpa-supplicant iw wireguard-tools hdparm sdparm smartmontools libgpiod libgpiod-tools libgpiod-python \
	git bash sudo e2fsprogs less procps iotop iftop rsnapshot cronie go-cryptfs cryptsetup lvm2 zram node-exporter ${RRSYNC_DEPS} \
	python3-distutils docker docker-compose \
	linux-firmware-rtl8192su linux-firmware-bcm43455 bluez-firmware-rpidistro-bcm4345c0-hcd \
"

inherit core-image extrausers

EXTRA_USERS_PARAMS = "\
	groupadd wheel; \
	groupadd -g 1000 rockpro; \
	useradd -m -u 1000 -g 1000 -G wheel,docker rockpro; \
	usermod -p '*' rockpro; \
"


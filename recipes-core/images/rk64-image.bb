DESCRIPTION = "RockPro64 base image."
LICENSE = "MIT"

IMAGE_FEATURES += "\
	read-only-rootfs \
	package-management \
	ssh-server-openssh \
	nfs-client \
	nfs-server \
"

RRSYNC_DEPS = "perl-module-socket perl-module-io-socket perl-module-file-glob"

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} \
	bitcoin monero lighthouse-bin mev-boost \
	nftables dnsmasq python3-fail2ban wpa-supplicant iw crda wireguard-tools hdparm sdparm smartmontools libgpiod libgpiod-tools libgpiod-python \
	git bash sudo e2fsprogs less procps iotop iftop rsnapshot cronie go-cryptfs cryptsetup lvm2 zram node-exporter ${RRSYNC_DEPS} \
	python3-distutils docker python3-docker-compose \
	kernel-module-xt-conntrack \
	kernel-module-xt-addrtype \
	kernel-module-xt-multiport \
	kernel-module-xt-nat \
	kernel-module-xt-masquerade \
	kernel-module-xt-ipvs \
	kernel-module-nfnetlink \
	kernel-module-nf-conntrack-netlink \
	kernel-module-br-netfilter \
	kernel-module-nfsd \
	kernel-module-b43 \
	kernel-module-brcmfmac \
	kernel-module-wireguard \
	${MACHINE_EXTRA_RRECOMMENDS} \
"

inherit core-image extrausers

EXTRA_USERS_PARAMS = "\
	groupadd wheel; \
	groupadd -g 1000 rockpro; \
	useradd -m -u 1000 -g 1000 -G wheel,docker rockpro; \
	usermod -p '*' rockpro; \
"


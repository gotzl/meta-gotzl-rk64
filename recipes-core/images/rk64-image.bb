DESCRIPTION = "RockPro64 base Image."
LICENSE = "MIT"

IMAGE_FEATURES += "\
	package-management \
	ssh-server-openssh \
	nfs-client \
	nfs-server \
"

RRSYNC_DEPS = "perl-module-socket perl-module-io-socket perl-module-file-glob"

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} \
	bitcoin openethereum \
	nftables dnsmasq python3-fail2ban wpa-supplicant iw wireguard-tools wireguard-module \
	git bash sudo e2fsprogs less procps iotop iftop rsnapshot cronie go-cryptfs cryptsetup lvm2 zram node_exporter ${RRSYNC_DEPS} \
	docker python3-docker-compose \
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
	kernel-module-r8712u \
	kernel-module-b43 \
    kernel-module-brcmfmac \
	kernel-module-wireguard \
    linux-firmware-rtl8192su \
	${MACHINE_EXTRA_RRECOMMENDS} \
"

# docker-compose pulls in specific versions 
#	jsonschema<3,>=2.5.1
#	requests!=2.11.0,!=2.12.2,!=2.18.0,<2.20,>=2.6.1
#	PyYAML<4,>=3.10
#	urllib3<1.24,>=1.21.1
# 	idna<2.8,>=2.5
PREFERRED_VERSION_python3-jsonschema = "2.6.0" 
PREFERRED_VERSION_python3-requests = "2.19.1" 
PREFERRED_VERSION_python3-requests = "3.13" 
PREFERRED_VERSION_python3-urllib3 = "1.23" 
PREFERRED_VERSION_python3-idna = "2.7"


inherit core-image extrausers

EXTRA_USERS_PARAMS = "\
	groupadd wheel; \
	groupadd -g 1000 rockpro; \
	useradd -m -u 1000 -g 1000 -G wheel,docker rockpro; \
	usermod -p '*' rockpro; \
"


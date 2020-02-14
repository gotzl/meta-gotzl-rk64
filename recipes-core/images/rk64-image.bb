DESCRIPTION = "RockPro64 base Image."
LICENSE = "MIT"

IMAGE_FEATURES += "\
	package-management \
	ssh-server-openssh \
	nfs-client \
	nfs-server \
"

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} \
	bitcoin nftables dnsmasq python3-fail2ban wpa-supplicant iw git bash sudo e2fsprogs \
	docker python3-docker-compose \
	kernel-module-xt-conntrack \
	kernel-module-xt-addrtype \
	kernel-module-xt-nat \
    kernel-module-xt-multiport \
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

# more recent bitcoin releases don't find boost any more
PREFERRED_VERSION_bitcoin = "0.17.2" 


inherit core-image extrausers

EXTRA_USERS_PARAMS = "\
	groupadd wheel; \
	useradd -m -G wheel,docker rockpro; \
	usermod -p '*' rockpro; \
"

CORE_IMAGE_EXTRA_INSTALL += " \
	io \
	linux-firmware-rk-cdndp \
	${RK_WIFIBT_FIRMWARES} \
"

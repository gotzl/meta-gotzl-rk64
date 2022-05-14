PACKAGECONFIG:append = " networkd"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://wired.network \
	file://wireless.network \
"

FILES:${PN} += " \
	${sysconfdir}/systemd/network/ \
"

do_install:append () {
	if ${@bb.utils.contains('PACKAGECONFIG','networkd','true','false',d)}; then
		install -d ${D}${sysconfdir}/systemd/network
		install -m 0644 ${WORKDIR}/wired.network ${D}${sysconfdir}/systemd/network/20-wired.network
		install -m 0644 ${WORKDIR}/wireless.network ${D}${sysconfdir}/systemd/network/25-wireless.network
	fi
}

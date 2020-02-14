PACKAGECONFIG_append = " networkd"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://wired.network \
	file://wireless.network \
"

FILES_${PN} += " \
	${sysconfdir}/systemd/network/ \
"

do_install_append () {
	if ${@bb.utils.contains('PACKAGECONFIG','networkd','true','false',d)}; then
		install -d ${D}${sysconfdir}/systemd/network
		install -m 0755 ${WORKDIR}/wired.network ${D}${sysconfdir}/systemd/network/20-wired.network
		install -m 0755 ${WORKDIR}/wireless.network ${D}${sysconfdir}/systemd/network/25-wireless.network
	fi
}

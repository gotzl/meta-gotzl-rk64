FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://config.toml \
"

do_install_append () {
    install -d ${D}${sysconfdir}/openethereum
    install -m 0644 ${S}/../config.toml ${D}${sysconfdir}/openethereum/
}
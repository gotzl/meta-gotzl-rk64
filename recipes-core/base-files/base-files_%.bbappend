FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install_append() {
    install -d -m 0777 ${D}/srv
    install -d -m 0777 ${D}/vault
    install -d -m 0777 ${D}/nvme
}
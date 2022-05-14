do_install:append() {
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" > ${D}${sysconfdir}/sudoers.d/rockpro
}

do_install:append() {
    install -d ${D}${sysconfdir}/default
    echo -e "ZRAM_SIZE_PERCENT=20\nZRAM_ALGORITHM=lzo\n" > ${D}${sysconfdir}/default/zram
}

FILES:${PN}:append = " /etc "

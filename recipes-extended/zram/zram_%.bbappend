do_install_append() {
    install -d ${D}${sysconfdir}/default
    echo -e "ZRAM_SIZE_PERCENT=20\nZRAM_ALGORITHM=lzo\n" > ${D}${sysconfdir}/default/zram
}

FILES_${PN}_append = " /etc "

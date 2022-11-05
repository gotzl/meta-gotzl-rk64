FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://jail.local \
"

do_compile () {
    # overwrite do_compile from upper recipe, executing fail2ban-2to3 seems broken and obsolete
}

do_install:append() {
    sed -i 's,\(\?(\?:%(__vserver)s\\s+)\),\1?(auth.info\\s+),g' ${D}${sysconfdir}/fail2ban/filter.d/common.conf
    install -m 644 ${WORKDIR}/jail.local ${D}${sysconfdir}/fail2ban/
}

# /etc/fail2ban/filter.d/common.conf
# __prefix_line = %(__date_ambit)s?\s*(?:%(__bsd_syslog_verbose)s\s+)?(?:%(__hostname)s\s+)?(?:%(__kernel_prefix)s\s+)?(?:%(__vserver)s\s+)?(?:%(__daemon_combs_re)s\s+)?(?:%(__daemon_extra_re)s\s+)?
# __prefix_line = %(__date_ambit)s?\s*(?:%(__bsd_syslog_verbose)s\s+)?(?:%(__hostname)s\s+)?(?:%(__kernel_prefix)s\s+)?(?:%(__vserver)s\s+)?(auth.\w*\s+)?(?:%(__daemon_combs_re)s\s+)?(?:%(__daemon_extra_re)s\s+)?

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install_append() {
    sed -i 's,\(\?(\?:%(__vserver)s\\s+)\),\1?(auth.info\\s+),g' ${D}${sysconfdir}/fail2ban/filter.d/common.conf
}

# /etc/fail2ban/filter.d/common.conf
# __prefix_line = %(__date_ambit)s?\s*(?:%(__bsd_syslog_verbose)s\s+)?(?:%(__hostname)s\s+)?(?:%(__kernel_prefix)s\s+)?(?:%(__vserver)s\s+)?(?:%(__daemon_combs_re)s\s+)?(?:%(__daemon_extra_re)s\s+)?
# __prefix_line = %(__date_ambit)s?\s*(?:%(__bsd_syslog_verbose)s\s+)?(?:%(__hostname)s\s+)?(?:%(__kernel_prefix)s\s+)?(?:%(__vserver)s\s+)?(auth.info\s+)?(?:%(__daemon_combs_re)s\s+)?(?:%(__daemon_extra_re)s\s+)?

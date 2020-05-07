FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install_append() {
    # make service mount /srv and use /srv/bitcoin as data dir
    sed -i -e '/^After=network.*/a RequiresMountsFor=/srv' \
           -e 's,-datadir=[^\s]*,-datadir=/srv/bitcoin/,g' \
           ${D}${systemd_unitdir}/system/bitcoind.service
}
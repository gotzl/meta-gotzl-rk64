FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_install:append() {
    # make service mount /ssd and use /ssd/bitcoin as data dir
    sed -i -e '/^After=network.*/a RequiresMountsFor=/ssd' \
           -e 's,-datadir=[^\s]*,-datadir=/ssd/bitcoin/,g' \
           ${D}${systemd_unitdir}/system/bitcoind.service
}

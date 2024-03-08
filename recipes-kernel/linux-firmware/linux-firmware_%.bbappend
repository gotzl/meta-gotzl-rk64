SRC_URI:append = "git://github.com/radxa/rkwifibt.git;protocol=https;branch=master;name=rkwifibt;destsuffix=rkwifibt"
SRCREV_rkwifibt = "bf5f91cb0e641962630979a8b73f668ae8bd8ed9"

do_install:append() {
	# this appears to be the most recent fw
	install -m 644 ${WORKDIR}/rkwifibt/firmware/cypress/wifi/cyfmac43455-sdio.txt ${D}${libdir}/firmware/cypress/
	install -m 644 ${WORKDIR}/rkwifibt/firmware/cypress/wifi/cyfmac43455-sdio.bin ${D}${libdir}/firmware/cypress/
	install -m 644 ${WORKDIR}/rkwifibt/firmware/cypress/wifi/cyfmac43455-sdio.clm_blob ${D}${libdir}/firmware/cypress/

	ln -snf brcmfmac43455-sdio.AW-CM256SM.txt ${D}${libdir}/firmware/brcm/brcmfmac43455-sdio.txt
	ln -snf brcmfmac43455-sdio.bin ${D}${libdir}/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.bin
}

FILES:${PN}-bcm43455 += " \
	/usr/lib/firmware/brcm/brcmfmac43455-sdio.txt \
	/usr/lib/firmware/brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.bin \
"

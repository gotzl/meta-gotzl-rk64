do_install_append() {
    # store the docker stuff on the external drive
    sed -i '/^Requires=docker.*/a RequiresMountsFor=/media/card' ${D}/${systemd_unitdir}/system/docker.service
    sed -i 's#dockerd#dockerd --data-root=/media/card/docker#g' ${D}/${systemd_unitdir}/system/docker.service
} 
PACKAGECONFIG:append = "transient-config"

do_install:append() {
    # store the docker stuff on the nvme
    sed -i '/^Requires=docker.*/a RequiresMountsFor=/nvme' ${D}/${systemd_unitdir}/system/docker.service
    sed -i 's#dockerd#dockerd --data-root=/nvme/docker#g' ${D}/${systemd_unitdir}/system/docker.service
} 

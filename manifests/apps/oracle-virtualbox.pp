
define xorg::apps::oracle-virtualbox (
    $ensure = present
) {
    # VirtualBox crashes with 3.18 kernels!

    apt::source { "oracle-virtualbox":
        ensure => $ensure,
        key => {
            id =>"7B0FAB3A13B907435925D9C954422A4B98AB5139",
            source => "http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc"
        },
        include => {
            src => false
        },
        location => "http://download.virtualbox.org/virtualbox/debian",
        release => $lsbdistcodename,
        repos => "contrib"
    }
    ->
    package { "virtualbox-$title":
        ensure => $ensure
    }

    if $ensure == present {
        Package["virtualbox-$title"]
        ->
        exec { "vboxdrv-setup":
            command => "/etc/init.d/vboxdrv setup",
            creates => "/lib/modules/$kernelrelease/updates/dkms/vboxdrv.ko"
        }
    }
}

class xorg::apps::geogebra {
    # BIG FAT DISCLAIMER
    # Geogebra5 does NOT start under kvm without nomodeset on Ubuntu 14.04!
    # It results in java virtual machine crashing with DnD.Cursor.CopyDrop
    # exceptions blabla which can be traced back to lack of hardware cursor
    # support in the particular video card driver used for kvm (?)

    apt::source { "geogebra":
        key => {
            id => "98272894F6478AA4434B41D3C072A32983A736CF",
            server => "keyserver.ubuntu.com"
        },
        include => {
            src => false
        },
        location => "http://www.geogebra.net/linux/",
        release => "stable",
        repos => "main",
    }
    ->
    package { "geogebra": ensure => purged } ->
    package { "geogebra5": ensure => installed }
}

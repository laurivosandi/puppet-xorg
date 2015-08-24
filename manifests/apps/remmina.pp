
class xorg::apps::remmina {
    # Remmina remote desktop client
    if $lsbdistcodename == "trusty" {
        apt::ppa { "ppa:remmina-ppa-team/remmina-next": package_manage => true }
    }

    package { "remmina": ensure => installed }
    package { "remmina-plugin-nx": ensure => installed }
    package { "remmina-plugin-rdp": ensure => installed }
    package { "remmina-plugin-vnc": ensure => installed }
}


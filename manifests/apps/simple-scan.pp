class xorg::apps::simple-scan {
    # The main scanning application
    package { "simple-scan": ensure => installed }
    package { "xsane": ensure => installed }
    package { "sane-utils": ensure => installed }
    package { "libsane-extras": ensure => installed }
    file { "/usr/share/applications/xsane.desktop": ensure => absent }
    package { "sane": ensure => purged }

    # Fix permissions, assumes correct /etc/security/groups
    group { "scanner":
        ensure => present,
        gid => 900,
    }
}

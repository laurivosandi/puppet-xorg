class xorg::apps::libreoffice {
    # Libreoffice
    package { "libreoffice": ensure => installed } ->
    package { "libreoffice-l10n-et": ensure => installed } ->
    package { "libreoffice-help-et": ensure => installed }
    package { "libreoffice-l10n-ru": ensure => installed } ->
    package { "libreoffice-help-ru": ensure => installed }
    package { "libreoffice-voikko": ensure => installed }
    package { "libreoffice-gnome": ensure => installed }
    package { "libreoffice-style-human": ensure => installed }

    if $lsbdistcodename == "trusty" {
        Package["libreoffice"] ->
        package { "openoffice.org-hyphenation": ensure => installed } ->
        file { "/usr/share/applications/libreoffice-math.desktop": ensure => absent } ->
        file { "/usr/share/applications/libreoffice-draw.desktop": ensure => absent }
        apt::ppa { "ppa:libreoffice/ppa": package_manage => true } ->
        Package["libreoffice"]
    }
}

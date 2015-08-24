class xorg::apps::mozilla-suite()

{
    if $architecture == "i386" or $architecture == "amd64" {
        if $lsbdistid == "Ubuntu" {
            package { "flashplugin-installer": ensure => installed }
        } else {
            package { "flashplugin-nonfree": ensure => installed }
        }
    }

    if $lsbdistid == "Debian" {
        package { "iceweasel": ensure => installed }
        package { "iceweasel-l10n-et": ensure => installed }
        package { "iceweasel-l10n-ru": ensure => installed }
        package { "icedove": ensure => installed }
        package { "icedove-l10n-et": ensure => installed }
        package { "icedove-l10n-ru": ensure => installed }
    } else {

        package { "firefox": ensure => installed }
        package { "firefox-locale-et": ensure => installed }
        package { "firefox-locale-ru": ensure => installed }
        package { "thunderbird": ensure => installed }
        package { "thunderbird-locale-et": ensure => installed }
        package { "thunderbird-locale-ru": ensure => installed }
        package { "xul-ext-ubufox": ensure => installed }
    }
    package { "enigmail": ensure => installed }

}

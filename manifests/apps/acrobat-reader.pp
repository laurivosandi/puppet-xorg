
class xorg::apps::acrobat-reader {
    include workstation::apt::koodur-repo

    # Install Acrobat Reader 9.5.5 but disable Firefox plugin
    if $architecture == "i386" or $architecture == "amd64" {
        package { "acroread": ensure => installed } ->
        file { "/usr/lib/mozilla/plugins/npwrapper.nppdf.so": ensure => absent } ->
        file { "/usr/lib/firefox/plugins/npwrapper.nppdf.so": ensure => absent } ->
        file { "/usr/lib/firefox-addons/plugins/nppdf.so": ensure => absent } ->
        file { "/usr/lib/firefox/plugins/nppdf.so": ensure => absent } ->
        file { "/usr/lib/mozilla/plugins/nppdf.so": ensure => absent }
    }
}

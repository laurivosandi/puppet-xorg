
class xorg::apps::pidgin {
    package { "pidgin": ensure => installed }
    package { "pidgin-openpgp": ensure => installed }
    package { "pidgin-otr": ensure => installed }
    package { "pidgin-plugin-pack": ensure => installed }
    package { "pidgin-lastfm": ensure => installed }
}


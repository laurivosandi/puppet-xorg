
class xorg::apps::rygel {
    # DLNA stuff
    package { "rygel": ensure => installed }
    package { "rygel-preferences": ensure => installed }
}

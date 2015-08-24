class xorg::apps::vlc {
    # VideoLAN Client
    package { "vlc": ensure => installed }

    if defined(Package["pulseaudio"]) {
        package { "vlc-plugin-pulse": ensure => installed }
    }
}

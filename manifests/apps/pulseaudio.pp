class xorg::apps::pulseaudio {
    # Install PulseAudio and utils
    package { "pulseaudio": ensure => installed }
    package { "pulseaudio-module-zeroconf": ensure => installed }
    package { "pulseaudio-module-bluetooth": ensure => installed }
    package { "pulseaudio-esound-compat": ensure => installed }
    package { "pulseaudio-utils": ensure => installed }
    package { "pavucontrol": ensure => purged }
    package { "paprefs": ensure => installed }
}


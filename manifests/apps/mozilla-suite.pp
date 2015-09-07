class xorg::apps::mozilla-suite()

{
    if $architecture == "i386" or $architecture == "amd64" {
        if $lsbdistid == "Ubuntu" {
            package { "flashplugin-installer": ensure => installed }
        } else {
            package { "flashplugin-nonfree": ensure => installed }
        }
    }

    # Install enigmail
    package { "enigmail": ensure => installed }

    # Install extra codecs
    package { "gstreamer1.0-libav": ensure => installed }
    package { "gstreamer0.10-plugins-ugly": ensure => installed }
    package { "gstreamer1.0-plugins-ugly": ensure => installed }
    package { "gstreamer0.10-plugins-bad": ensure => installed }
    package { "gstreamer1.0-plugins-bad": ensure => installed }
    package { "gstreamer0.10-fluendo-mp3": ensure => installed }
    package { "gstreamer1.0-fluendo-mp3": ensure => installed }
    package { "libavcodec-extra": ensure => installed }

    # http://askubuntu.com/questions/475351/firefox-html5-video-support
    file { "/etc/firefox/syspref.js":
        ensure => present,
        mode => 644,
        owner => root,
        group => root
    }
    ->
    file_line { "firefox-fragmented-mp4-exposed":
        path => "/etc/firefox/syspref.js",
        ensure => present,
        match => '^pref\("media\.fragmented\-mp4\.exposed",',
        line => 'pref("media.fragmented-mp4.exposed", true);'
    }
    ->
    file_line { "firefox-fragmented-mp4-ffmpeg-enabled":
        path => "/etc/firefox/syspref.js",
        ensure => present,
        match => '^pref\("media\.fragmented\-mp4\.ffmpeg\.enabled",',
        line => 'pref("media.fragmented-mp4.ffmpeg.enabled", true);'
    }
    ->
    file_line { "firefox-mediasource-mp4-enabled":
        path => "/etc/firefox/syspref.js",
        ensure => present,
        match => '^pref\("media\.mediasource\.mp4\.enabled",',
        line => 'pref("media.mediasource.mp4.enabled", true);'
    }
    ->
    file_line { "firefox-mediasource-webm-enabled":
        path => "/etc/firefox/syspref.js",
        ensure => present,
        match => '^pref\("media\.mediasource\.webm\.enabled",',
        line => 'pref("media.mediasource.webm.enabled", true);'
    }
    ->
    file_line { "firefox-mediasource-enabled":
        path => "/etc/firefox/syspref.js",
        ensure => present,
        match => '^pref\("media\.mediasource\.enabled",',
        line => 'pref("media.mediasource.enabled", true);'
    }

    file { "/etc/thunderbird/syspref.js":
        ensure => present,
        mode => 644,
        owner => root,
        group => root
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
}

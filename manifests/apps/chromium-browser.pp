
class xorg::apps::chromium-browser {
    # Pepperflash plugin
    if $architecture == "i386" or $architecture == "amd64" {
        package { "pepperflashplugin-nonfree": ensure => installed }
    }

    # Chromium is the default browser
    package { "chromium-browser": ensure => latest }
	if $lsbdistid == "Debian" {
        package { "chromium-inspector": ensure => installed }
    } elsif $lsbdistcodename == "trusty" {
        package { "chromium-browser-l10n": ensure => installed } ->
        package { "chromium-codecs-ffmpeg-extra": ensure => installed }
    }

    # Hide title bar on Linux
    file { "/etc/skel/.config":
        ensure => directory,
        owner => root,
        group => root,
        mode => 755
    }
    ->
    file { "/etc/skel/.config/chromium":
        ensure => directory,
        owner => root,
        group => root,
        mode => 755
    }
    ->
    file { "/etc/skel/.config/chromium/Default":
        ensure => directory,
        owner => root,
        group => root,
        mode => 755
    }
    ->
    file { "/etc/skel/.config/chromium/Default/Preferences":
        ensure => present,
        owner => root,
        group => root,
        mode => 644,
        content => "{\"browser\":{\"custom_chrome_frame\":true}}"
    }
}

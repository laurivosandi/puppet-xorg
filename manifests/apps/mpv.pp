class xorg::apps::mpv {

    if $architecture == 'i386' or $architecture == 'amd64' {
        # Install Intel VA-API drivers
        package { 'vdpau-va-driver': ensure => installed }
        package { 'i965-va-driver': ensure => installed }
        package { 'vainfo': ensure => installed }
    }

    # Video playback
    package { 'mplayer': ensure => purged }
    package { 'mplayer2': ensure => purged }
    package { 'vdpauinfo': ensure => installed }
    package { 'mpv': ensure => installed }
    ->
    file_line { "mpv-vo":
        path => "/etc/mpv/mpv.conf",
        match => "^vo=",
        line => "vo=vdpau,vaapi,xv,v11"
    }
    ->
    file_line { "mpv-hwdec":
        path => "/etc/mpv/mpv.conf",
        match => "^hwdec=",
        line => "hwdec=vdpau,vaapi"
    }
    ->
    file_line { "mpv-cache":
        path => "/etc/mpv/mpv.conf",
        match => "^cache=",
        line => "cache=8192"
    }
    ->
    file_line { 'Hide mpv icon from menu':
        path => '/usr/share/applications/mpv.desktop',
        match => '^NoDisplay=',
        line => 'NoDisplay=true'
    }
}

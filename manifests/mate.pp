class xorg::mate {
    # Include Xorg, LightDM etc
    include xorg

    if $lsbdistcodename == "wheezy" {
        # Enable user switching
        file { "/usr/bin/gdmflexiserver":
            owner => root,
            group => root,
            mode => 755,
            content => "#!/bin/sh\n/usr/bin/dm-tool switch-to-greeter\n"
        }
    }

    Package["lightdm"] ->
    package { "dmz-cursor-theme": ensure => installed } ->
    package { "mate-desktop-environment": ensure => installed } ->
    package { "mate-applets": ensure => installed } ->
    package { "mate-themes": ensure => installed } ->
    package { "mate-settings-daemon-pulse": ensure => installed } ->
    package { "mate-sensors-applet": ensure => installed } ->
    package { "mate-gnome-main-menu-applet": ensure => installed } ->
    package { "mate-screensaver": ensure => installed } ->
    package { "mate-netspeed": ensure => installed } ->
    package { "lightdm-gtk-greeter": ensure => installed } ->
    package { "seahorse": ensure => installed } ->
    package { "mate-menu": ensure => installed } ->
    package { "mate-power-manager": ensure => installed } ->
    package { "mate-system-monitor": ensure => installed } ->
    package { "mate-utils": ensure => installed }

    # Desktop applications
    Package["mate-desktop-environment"] ->
    package { "pluma": ensure => installed } ->
    package { "atril": ensure => installed } ->
    package { "galculator": ensure => installed } ->
    package { "eom": ensure => installed }

    # Accessibility tools
    Package["mate-desktop-environment"] ->
    package { "gnome-orca": ensure => installed }

    # GNOME keyring only
    Package["mate-desktop-environment"] ->
    package { "mate-keyring": ensure => absent } ->
    package { "gnome-keyring": ensure => installed }

    # Remove MATE Tweak
    Package["mate-desktop-environment"] ->
    package { "mate-tweak": ensure => absent }

    # No need for extra icons
    Package["mate-desktop-environment"] ->
    package { "mate-icon-theme-faenza": ensure => absent }


    # No mimetypes associated
    Package["mate-desktop-environment"] ->
    file { "/usr/share/applications/caja-browser.desktop": ensure => absent } ->
    file { "/usr/share/applications/mate-system-monitor.desktop": ensure => absent } ->
    file { "/usr/share/applications/mate-disk-usage-analyzer.desktop": ensure => absent } ->
    file { "/usr/share/applications/mate-power-statistics.desktop": ensure => absent } ->
    file { "/usr/share/applications/mate-system-log.desktop": ensure => absent } ->
    file { "/usr/share/applications/mate-terminal.desktop": ensure => absent }

    Package["mate-desktop-environment"] ->
    package { "engrampa": ensure => installed } ->
    file_line { 'Hide Engrampa icon from menu':
        path => '/usr/share/applications/engrampa.desktop',
        line => "NoDisplay=true",
    }

    Package["mate-desktop-environment"] ->
    package { "python-caja": ensure => installed }
    ->
    file { "/usr/share/caja-python/extensions/background-image.py":
        ensure => absent,
        mode => 644,
        owner => root,
        group => root,
        source => "puppet:///modules/xorg/background-image.py"
    }

    if $lsbdistid == "Ubuntu" {
        Package["mate-desktop-environment"] ->
        package { "ubuntu-mate-lightdm-theme": ensure => installed } ->
        package { "ubuntu-mate-wallpapers": ensure => installed }
    }

    Package["mate-desktop-environment"] ->
    package { "gnome-icon-theme-symbolic": ensure => installed }

    # mate-indicator-applet uses GTK2
    Package["mate-desktop-environment"] ->
    package { "indicator-application-gtk2": ensure => installed } ->
    package { "indicator-sound-gtk2": ensure => installed } ->
    package { "mate-indicator-applet": ensure => installed }

    # indicator-sound launches mate-volume-control command from mate-media-pulse package
    Package["mate-desktop-environment"] ->
    package { "mate-media": ensure => absent } ->
    package { "mate-media-gstreamer": ensure => absent } ->
    package { "mate-media-pulse": ensure => installed } ->
    package { "libcanberra-gtk-module": ensure => installed } ->
    package { "libcanberra-gtk3-0": ensure => installed }

    # Enable filesharing over HTTP and Bluetooth
    Package["mate-desktop-environment"] ->
    package { "mate-user-share": ensure => installed }

    if $lsbdistcodename == "trusty" {
        # Enable MATE repo for Ubuntu 14.04
        apt::ppa { "ppa:ubuntu-mate-dev/trusty-mate": package_manage => true }
        apt::ppa { "ppa:ubuntu-mate-dev/ppa": package_manage => true } ->
        Package["mate-desktop-environment"]

        # Seems to fix nm-applet launch issue in MATE session
        package { "ubuntu-mate-default-settings": ensure => installed }

        # Install Bluetooth stuff
        package { "blueman": ensure => installed }

        # Fix file associations for Firefox under MATE
        Package["gvfs-bin"]
        ->
        file { "/usr/bin/xdg-open":
            ensure => present, mode => 755, owner => root, group => root,
            source => "puppet:///modules/xorg/xdg-open"
        }
        ->
        file { "/usr/bin/xdg-mime":
            ensure => present, mode => 755, owner => root, group => root,
            source => "puppet:///modules/xorg/xdg-mime"
        }
    } else {
        # MATE is present in jessie and wheezy-backports
        Package["mate-desktop-environment"] ->
        package { "libbluetooth3": ensure => installed }
    }

}


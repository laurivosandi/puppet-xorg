class xorg {

    # Ubuntu and MATE both are migrating to indicator approach for tray icons
    # otherwise nm-applet and others are not shown
    package { "indicator-application": ensure => installed }

    # Fonts
    package { "ttf-mscorefonts-installer": ensure => installed }
    package { "fonts-crosextra-carlito": ensure => installed }
    package { "fonts-crosextra-caladea": ensure => installed }
    package { "fonts-dejavu": ensure => installed }
    package { "ttf-liberation": ensure => installed }
    package { "ttf-wqy-zenhei": ensure => installed }
    package { "fonts-ipafont-mincho": ensure => installed }
    package { "fonts-ipafont-gothic": ensure => installed }
    package { "ttf-unfonts-core": ensure => installed }
    package { "fonts-sil-gentium": ensure => installed }
    package { "fonts-sil-gentium-basic": ensure => installed }
    package { "ttf-georgewilliams": ensure => installed }
    package { "ttf-sjfonts": ensure => installed }
    package { "fonts-kacst-one": ensure => installed }
    package { "fonts-lao": ensure => installed }
    package { "fonts-lklug-sinhala": ensure => installed }
    package { "fonts-opendyslexic": ensure => installed }
    package { "fonts-sil-abyssinica": ensure => installed }
    package { "fonts-sil-padauk": ensure => installed }
    package { "fonts-thai-tlwg": ensure => installed }
    package { "fonts-tibetan-machine": ensure => installed }
    package { "fonts-tlwg-garuda": ensure => installed }
    package { "fonts-tlwg-kinnari": ensure => installed }
    package { "fonts-tlwg-loma": ensure => installed }
    package { "fonts-tlwg-mono": ensure => installed }
    package { "fonts-tlwg-norasi": ensure => installed }
    package { "fonts-tlwg-purisa": ensure => installed }
    package { "fonts-tlwg-sawasdee": ensure => installed }
    package { "fonts-tlwg-typewriter": ensure => installed }
    package { "fonts-tlwg-typist": ensure => installed }
    package { "fonts-tlwg-typo": ensure => installed }
    package { "fonts-tlwg-umpush": ensure => installed }
    package { "fonts-tlwg-waree": ensure => installed }

    if $lsbdistid == "Ubuntu" {
        # More Ubuntu specific fonts
        package { "ttf-ubuntu-font-family": ensure => installed }
        package { "ttf-indic-fonts-core": ensure => installed }
        package { "fonts-khmeros-core": ensure => installed }
        package { "ttf-punjabi-fonts": ensure => installed }
        package { "fonts-takao-pgothic": ensure => installed }
    } else {
        package { "fonts-lohit-guru": ensure => installed }
        package { "fonts-guru-extra": ensure => installed }
        package { "fonts-guru": ensure => installed }
    }

    # Core desktop packages
    package { "xcursor-themes": ensure => installed }
    package { "desktop-base": ensure => installed }
    package { "xserver-xorg": ensure => installed }
    package { "xserver-xorg-video-all": ensure => installed }
    package { "xorg": ensure => installed }
    package { "xbitmaps": ensure => installed }
    package { "nouveau-firmware": ensure => installed }
    package { "lightdm": ensure => installed }
    package { "gnome-backgrounds": ensure => installed }
    package { "gvfs-backends": ensure => installed }
    package { "gvfs-fuse": ensure => installed }
    package { "gvfs-bin": ensure => installed } # gvfs-open
    package { "mesa-utils": ensure => installed }

    # Automatic Desktop -> Toolaud renaming
    package { "xdg-user-dirs": ensure => installed }
    package { "xdg-user-dirs-gtk": ensure => installed }

    # Create directory for modular Xorg config
    file { "/etc/X11/xorg.conf":
        ensure => file,
        mode => 644,
        owner => root,
        group => root,
        content => "# Managed by Puppet, use /etc/X11/xorg.conf.d/blah.conf\n"
    }

    file { "/etc/X11/xorg.conf.d": ensure => directory }

    if $lsbdistid == "Debian" {
        # Fix font rendering on Debian
        file { "/etc/fonts":
            ensure => directory,
            mode => 755,
            owner => root,
            group => root,
        }
        ->
        file { "/etc/fonts/local.conf":
            ensure => present,
            mode => 644,
            owner => root,
            group => root,
            source => "puppet:///modules/xorg/fonts.conf"
        }
    }
}


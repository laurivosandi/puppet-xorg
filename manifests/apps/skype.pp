class xorg::apps::skype {
    if $architecture == "i386" or $architecture == "amd64" {
        if $architecture == "amd64" {

            # Add i386 architecture for Skype and wine
            exec { 'add-i386':
                command => '/usr/bin/dpkg --add-architecture i386',
                unless  => '/usr/bin/dpkg --print-foreign-architectures | /bin/grep i386'
            }
            ->
            Apt::Source["$lsbdistcodename-partner"] ->
            Exec["apt_update"] ->
            package { "skype:i386": ensure => installed }
        } else {
            Apt::Source["$lsbdistcodename-partner"] ->
            package { "skype": ensure => installed }
        }
    }
}

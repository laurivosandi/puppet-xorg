class xorg::apps::oracle-java(
    $version = "present"
) {
    apt::ppa { "ppa:webupd8team/java":
        package_manage => true
    }
    ->
    exec { "oracle-java-licence-selected":
        command => "/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections"
    }
    ->
    exec { "oracle-java-licence-seen":
        command => "/bin/echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections"
    }
    ->
    package { "oracle-java9-installer":
        ensure => $version
    }
}


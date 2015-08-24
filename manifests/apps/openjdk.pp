
class xorg::apps::openjdk {
    package { "icedtea-7-plugin": ensure => installed }
    package { "openjdk-7-jre": ensure => installed }
}

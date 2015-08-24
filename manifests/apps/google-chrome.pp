class xorg::applications::google-chrome {
    if $architecture == "i386" or $architecture == "amd64" {
        file { "/etc/apt/sources.list.d/google-chrome.list": ensure => absent } ->
        apt::source { "google-chrome-beta":
            key => "7FAC5991",
            key_source => "https://dl-ssl.google.com/linux/linux_signing_key.pub",
            location => "http://dl.google.com/linux/chrome/deb/",
            release => "stable",
            repos => "main",
            include_src => false
        }
        ->
        package { "google-chrome-beta": ensure => installed }
    } else {
        file { "/etc/apt/sources.list.d/google-chrome-beta.list":
            ensure => absent
        }
    }
}

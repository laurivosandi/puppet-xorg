
class xorg::apps::gummi {
    # LaTeX editor and backends
    package { "gummi": ensure => installed }
    package { "texlive-fonts-extra": ensure => installed }
    package { "texlive-fonts-recommended": ensure => installed }
    package { "texlive-latex-extra": ensure => installed } # makeglossaries
    package { "texlive-publishers": ensure => installed } # IEEEtran
    package { "lmodern": ensure => installed } # lmodern.sty
}


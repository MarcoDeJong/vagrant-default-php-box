class apache {

  package { "apache2":
    ensure => present,
  }

  service { "apache2":
    ensure => running,
    enable => true,
    require => Package["apache2"],
  }

  file { "/etc/apache2/sites-available/000-default.conf":
      ensure  => present,
      source  => "puppet:///modules/apache/vhost",
      require => Package['apache2'],
      notify => Service['apache2']
  }

  define apache::loadmodule () {
    exec { "a2enmod $name" :
      require => Package[apache2],
      unless => "/bin/readlink -e /etc/apache2/mods-enabled/${name}.load",
      notify => Service['apache2']
    }
  }

  apache::loadmodule{"rewrite":}
  apache::loadmodule{"proxy":}
  apache::loadmodule{"proxy_fcgi":}

}
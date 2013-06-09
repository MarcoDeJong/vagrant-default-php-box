# Adds an Apache configuration file.
define apache::conf() {
  file { "/etc/apache2/${name}":
    require => Package['apache2'],
    source  => "puppet:///modules/apache/${name}",
    notify  => Service['apache2'];
  }
}

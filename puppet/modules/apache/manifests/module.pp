# Enables an Apache module.
define apache::module() {
  file { "/etc/apache2/mods-enabled/${name}":
    ensure  => link,
    require => Package['apache2'],
    target  => "/etc/apache2/mods-available/${name}",
    notify  => Service['apache2'];
  }
}

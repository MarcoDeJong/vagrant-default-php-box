exec { "apt-get update":
  path => "/usr/bin",
}
package { "apache2":
  ensure  => present,
  require => Exec["apt-get update"],
}

service { "apache2":
  ensure  => "running",
  require => Package["apache2"],
}
package {
    ['mysql-server', 'mysql-client']:
        ensure => present,
        require => Exec['apt-get update'],
}
package {
    ['php5','php5-xdebug','php5-mysql','php5-mcrypt','php5-curl','php5-gd','php5-gmp', 'php5-fpm', 'php-pear']:
        ensure => present,
        require => [Exec['apt-get update'], Package['apache2', 'mysql-server']],
}
package {
    'vim':
        ensure => present,
        require => Exec['apt-get update'],
}
package {
    'git':
        ensure => present,
        require => Exec['apt-get update'],
}
package {
    'curl':
        ensure => present,
        require => Exec['apt-get update'],
}
package {
    'wget':
        ensure => present,
        require => Exec['apt-get update'],
}

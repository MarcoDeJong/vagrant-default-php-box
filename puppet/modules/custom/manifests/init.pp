class custom {
  package { 'vim':
    ensure  => present,
    require => Exec['apt-get update']
  }
  package { 'git':
    ensure  => present,
    require => Exec['apt-get update']
  }
  package { 'curl':
    ensure  => present,
    require => Exec['apt-get update']
  }
  package { 'wget':
    ensure  => present,
    require => Exec['apt-get update']
  }
  package { 'unzip':
    ensure  => present,
    require => Exec['apt-get update']
  }
  package { 'phpmyadmin':
    ensure  => present,
    require => [ Package["apache2"], Package["php5"], Package["mysql-server"], Exec['apt-get update'] ]
  }
  file { '/etc/apache2/conf.d/phpmyadmin.conf':
    ensure  => 'link',
    require => Package["phpmyadmin"],
    target  => '/etc/phpmyadmin/apache.conf'
  }
  package { 'rubygems':
    ensure => 'installed'
  }
  package { 'sass':
    ensure   => "installed",
    require  => Package["rubygems"],
    provider => "gem"
  }
  package { 'compass':
    ensure   => 'installed',
    require  => [ Package["sass"], Package["rubygems"] ],
    provider => 'gem'
  }
  exec { 'AddDnsServer':
    command => "echo 'nameserver 8.8.8.8' >> /etc/resolv.conf; echo 'nameserver 8.8.4.4' >> /etc/resolv.conf", 
    unless  => "/bin/grep -c 'nameserver 8.8.8.8' /etc/resolv.conf",
  }
  package { 'memcachedb':
    ensure => present,
    require => Exec['apt-get update']
  }
  service { 'memcachedb':
    ensure  => running,
    require => Package['memcachedb']
  }
  package { 'libpcre3-dev':
    ensure => present,
    require => [ Exec['apt-get update'], Package["php5"] ]
  }
  exec { "pecl install apc":
    command => "pecl install apc",
    creates => "/usr/lib/php5/20090626/apc.so",
    require => [ Exec['apt-get update'], Package["php5"], Package["libpcre3-dev"] ]
  }
  file { "/etc/php5/conf.d/apc.ini":
    require => [Exec['pecl install apc']],
    source  => "puppet:///modules/custom/apc.ini",
    notify  => Service['apache2']
  }
}

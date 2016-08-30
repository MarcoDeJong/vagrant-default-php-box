class php {

  exec { 'restarting... php7.1-fpm':
    command => 'sudo service php7.1-fpm restart',
    require => [
      File['php-ini'],
    ]
  }

  file { 'php-ini':
    path 		=> '/etc/php/7.1/fpm/php.ini',
    ensure 	=> present,
    source 	=> 'puppet:///modules/php/php.ini',
    require => Service['php7.1-fpm'],
  }

  service { 'php7.1-fpm':
    ensure => running,
    require => [
      Package['php7.1'],
      Package['php7.1-fpm'],
    ]
  }

  package { [
    'php7.1',
    'php7.1-fpm',
    'php7.1-mysql',
    'php7.1-dev',
    'php7.1-mbstring',
    'php7.1-mcrypt'
  ]:
    ensure => present,
    require => Exec['apt-get update && purge php 5'],
  }

  exec { 'apt-get update && purge php 5':
    command => 'sudo apt-get update && sudo apt-get purge php5-fpm -y && sudo apt-get --purge autoremove -y',
    require => Exec['apt-add ondrej/php'],
  }

  exec { 'apt-add ondrej/php':
    command => 'sudo apt-add-repository ppa:ondrej/php -y',
    require => Exec['php pre-install tasks'],
  }

  # deal with characters in repository name
  exec { 'php pre-install tasks':
    command => 'sudo apt-get install -y language-pack-en-base && sudo locale-gen && export LC_ALL=en_US.UTF-8 && sudo apt-get install -y software-properties-common',
  }

  package { "libapache2-mod-php7.1":
    ensure => present,
    require => Service['php7.1-fpm'],
  }
}
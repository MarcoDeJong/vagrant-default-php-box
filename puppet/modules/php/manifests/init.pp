# Installs PHP5 and necessary modules. Sets config files.
class php {
  package { ['php5',
             'php5-cli',
             'libapache2-mod-php5',
             'php5-curl',
             'php5-dev',
             'php5-gd',
             'php5-imagick',
             'php5-intl',
             'php5-json',
             'php5-mcrypt',
             'php5-memcached',
             'php5-mysql',
             'php-pear',
             'php5-pspell',
             'php5-sqlite',
             'php5-tidy',
             'php5-xdebug',
             'php5-xmlrpc',
             'php5-xsl']:
    ensure  => present,
    require => [ Exec['apt-get update'], Package['apache2', 'mysql-server', 'memcached'] ];
  }

  file {
    '/etc/php5/apache2':
      ensure  => directory,
      require => Package['php5'],
      before  => File ['/etc/php5/apache2/php.ini'];

    '/etc/php5/apache2/php.ini':
      source  => 'puppet:///modules/php/apache2-php.ini',
      require => Package['php5'],
      notify  => Service['apache2'];

    '/etc/php5/cli':
      ensure  => directory,
      require => Package['php5'],
      before  => File ['/etc/php5/cli/php.ini'];

    '/etc/php5/cli/php.ini':
      source  => 'puppet:///modules/php/cli-php.ini',
      require => Package['php5-cli'];
  }
}

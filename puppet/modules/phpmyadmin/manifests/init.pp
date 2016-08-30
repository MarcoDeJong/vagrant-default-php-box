class phpmyadmin{

  require php

  package
  {
    "phpmyadmin":
      ensure => present,
      require => Exec['apt-add nijel/phpmyadmin']
  }

  exec { 'apt-add nijel/phpmyadmin':
    command => 'sudo add-apt-repository ppa:nijel/phpmyadmin -y && apt-get update'
  }

  exec { 'apt-remove nijel/phpmyadmin':
    command => 'sudo add-apt-repository --remove ppa:nijel/phpmyadmin -y && apt-get update'
  }

  # Enable access via /phpmyadmin
  # This assumes apache is installed somewhere else in the Puppet manifests
  file { '/etc/apache2/sites-enabled/phpmyadmin.conf':
    ensure  => 'link',
    target => '/etc/phpmyadmin/apache.conf',
    require => Package['phpmyadmin'],
    notify => [Service['apache2'],
              Exec['apt-remove nijel/phpmyadmin']]
  }

}

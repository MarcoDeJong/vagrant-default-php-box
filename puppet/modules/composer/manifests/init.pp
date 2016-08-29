class composer {

  exec { 'install composer':
    command => 'curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer',
    require => Package['curl']
  }

}
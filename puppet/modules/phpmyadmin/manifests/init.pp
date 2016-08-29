class phpmyadmin{

  package
  {
    "phpmyadmin":
      ensure => present,
      require => Package["apache2"]
  }

  file
  {
    "/etc/apache2/sites-available/phpmyadmin.conf":
      ensure => link,
      target => "/etc/phpmyadmin/apache.conf",
      require => Package['phpmyadmin']
  }

  exec { "config":
    command => "a2ensite phpmyadmin",
    require => Service['apache2']
  }
}
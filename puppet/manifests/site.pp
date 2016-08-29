# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

# default path
Exec { path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"] }

include baseconfig
include apache
include php
include mysql
include phpmyadmin
include nodejs
include composer

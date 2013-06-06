class custom {
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
package {
    'unzip':
        ensure => present,
        require => Exec['apt-get update'],
}
package {
    'phpmyadmin':
        ensure => present,
        require => [Package["apache2"],Package["php5"],Package["mysql-server"],Exec['apt-get update']],
}
file { '/etc/apache2/conf.d/phpmyadmin.conf':
        ensure => 'link',
        target => '/etc/phpmyadmin/apache.conf',
        require => Package["phpmyadmin"]
}
package { "rubygems":
        ensure => "installed"
}
package { "sass":
        ensure => "installed",
        provider => "gem",
        require => Package["rubygems"]
}
package { "compass":
        ensure => "installed",
        provider => "gem",
        require => [Package["sass"],Package["rubygems"]],
}
exec { "AddDnsServer" :
        command => "echo 'nameserver 8.8.8.8' >> /etc/resolv.conf; echo 'nameserver 8.8.4.4' >> /etc/resolv.conf", 
        unless  => "/bin/grep -c 'nameserver 8.8.8.8' /etc/resolv.conf",
}
package { 'memcachedb':
        ensure => present,
        require => Exec['apt-get update'],
}
service { 'memcachedb':
        ensure  => running,
        require => Package['memcachedb'],
}
}

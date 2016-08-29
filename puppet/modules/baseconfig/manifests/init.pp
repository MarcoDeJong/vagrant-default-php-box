class baseconfig {

  # silence puppet and vagrant annoyance about the puppet group
  group { 'puppet':
    ensure => 'present'
  }

  exec { 'AddDnsServer':
    command => "echo 'nameserver 8.8.8.8' >> /etc/resolv.conf; echo 'nameserver 8.8.4.4' >> /etc/resolv.conf",
    unless  => "/bin/grep -c 'nameserver 8.8.8.8' /etc/resolv.conf",
  }

  # ensure local apt cache index is up to date before beginning
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

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


}
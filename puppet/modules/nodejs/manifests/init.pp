class nodejs {

  package { ['nodejs']:
    ensure => present,
  }

  package { ['build-essential']:
    ensure => present,
  }

}
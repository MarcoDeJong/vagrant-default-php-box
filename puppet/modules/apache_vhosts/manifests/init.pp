# == Class: apache_vhosts
#
# Adds and enables virtual hosts. Sets up /var/www symlinks.
#
class apache_vhosts {
    # Link the default apache webroot folder to the vagrant share
    file { '/var/www':
        ensure => 'link',
        target => '/vagrant/sites/www',
    }

    apache_vhosts::vhost { ['box']: }
}

# Class wordpress::db
#
# This class restores the wordpress database from a mysql dump taken right after installation.
#
# Requires:
#  The mysql::server class from the puppetlabs-mysql module.
class wordpress::db {

  file { '/opt/wordpress/wordpress.mysql':
    ensure  => file,
    source  => 'puppet:///modules/wordpress/wordpress.mysql',
    notify  => Exec['restore-fresh-db'],
    require => Class['mysql::server'],
  }
  exec { "restore-fresh-db":
    path        => '/usr/bin',
    command     => "mysql -D wordpress < /opt/wordpress/wordpress.mysql",
    refreshonly => true,
  }

}

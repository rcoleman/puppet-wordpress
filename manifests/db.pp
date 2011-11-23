# Class wordpress::db
#
# This class restores the wordpress database from a mysql dump taken right after installation.
#
# Requires:
#  The mysql::server class from the puppetlabs-mysql module.
class wordpress::db {

  if $::ec2_public_hostname {
    $sitehost = $::ec2_public_hostname
  }
  else {
    $sitehost = $::fqdn
  }

  file { '/opt/wordpress/wordpress.mysql':
    ensure  => file,
    content => template('wordpress/wordpress-mysqldump.erb'),
    notify  => Exec['restore-fresh-db'],
    require => Class['mysql::server'],
  }
  exec { "restore-fresh-db":
    path        => '/usr/bin',
    command     => "mysql -D wordpress < /opt/wordpress/wordpress.mysql",
    refreshonly => true,
  }

}

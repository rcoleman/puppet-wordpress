class {'wordpress':
  wordpress_db_name     => 'wordpress',
  wordpress_db_user     => 'wordpress',
  wordpress_db_password => 'wordpress',
  require               => Class['mysql::server'],
}

class { 'mysql': }
class { 'mysql::server':
  config_hash => { 'root_password' => 'wordpress' }
}
mysql::db { 'wordpress':
  user     => 'wordpress',
  password => 'wordpress',
  host     => 'localhost',
  grant    => ['all'],
}
wordpress::adminuser { 'ryan':
  user_pass    => 'puppetftw',
  display_name => 'Ryan Coleman',
  user_email   => 'ryan@puppetlabs.com',
  user_url     => 'http://www.puppetlabs.com',
  require      => Mysql::Db['wordpress'],
}

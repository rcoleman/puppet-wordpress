# Class: wordpress
#
# This module creates a working wordpress instance, running on port 80.
#
#
# Parameters:
#  wordpress_db_name, wordpress_db_user & wordpress_db_password
#
# Actions:
#
# Creates a wordpress instance, running on port 80.
#
# Requires: puppetlabs-mysql
#
# Sample Usage:
#
# class {'wordpress':
#   wordpress_db_name     => 'wordpress',
#   wordpress_db_user     => 'wordpress',
#   wordpress_db_password => 'wordpress',
#   require               => Mysql::Db['wordpress'],
# }
#
# mysql::db { 'wordpress':
#   user     => 'wordpress',
#   password => 'wordpress',
#   host     => 'localhost',
#   grant    => ['all'],
# }
#
class wordpress($wordpress_db_name="wordpress",$wordpress_db_user="wordpress",$wordpress_db_password="password") {
$db_name = $wordpress_db_name
$db_user = $wordpress_db_user
$db_password = $wordpress_db_password
	include wordpress::app
	include wordpress::db
}

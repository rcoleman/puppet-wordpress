define wordpress::adminuser($user_login=$name, $user_pass, $display_name, $user_email, $user_url) {

  $user_key = fqdn_rand(10000,30)
  file { "/opt/wordpress/wordpress-admin-$name":
    ensure  => file,
    mode    => 0600,
    content => template("wordpress/wordpress-admin.erb"),
    notify  => Exec['create-admin-user'],
  }

  exec { "create-admin-user":
    path        => '/usr/bin',
    command     => "mysql < /opt/wordpress/wordpress-admin-$name",
    refreshonly => true,
  }

}

class mysql::config {
      file { "/etc/my.cnf":
	ensure => present,
	source => "puppet:///modules/mysql/my.cnf",
	owner => "mysql",
	group => "mysql",
	require => Class["mysql::install"],
	notify => Class["mysql::service"],
	}

     file { "/var/lib/mysql":
	group => "mysql",
	owner => "mysql",
	recurse => true,
	require => File["/etc/my.cnf"],
	}
 }


	
	

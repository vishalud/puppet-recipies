class mysql::install {
	package { [ "mysql-server", "perl-DBD-MySQL", "mysql" ]:
	ensure => present,
	require => User["mysql"],	
	}

user { "mysql":
	ensure => present,
	comment => "MySQL User",
	gid => "mysql",
	shell => "/bin/false",
	require => Group["mysql"],
}	

group { "mysql":
	ensure => present,
	}
}

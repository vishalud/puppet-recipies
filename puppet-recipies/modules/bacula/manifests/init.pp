
class bacula::client {
	package { "bacula-client":
		ensure => present,
	}

}

	
class bacula::service { 
	service { "bacula-fd":
		ensure => running,
		enable=> true,
		hasstatus => true,
		hasrestart => true,
		require => Class["bacula::conf"]
	}
}

class bacula::conf { 
	file { "/etc/bacula/bacula-fd.conf":
		mode => "644",
		owner => "root",
		group => "root",
		ensure => "present",
		#source => "puppet:///modules/bacula/templates/bacula-fd.conf",
		content => template("bacula/filedaemon.erb"),
	}

}
			


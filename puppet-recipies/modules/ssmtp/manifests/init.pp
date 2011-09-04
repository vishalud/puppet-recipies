class ssmtp::install { 
	package {"ssmtp":
	ensure => "present",
	}
}

class ssmtp::config { 
	file {"/etc/ssmtp/ssmtp.conf":
	ensure => "present",
	owner => "root",
	group => "root",
	mode => "0600",
#	source => "puppet:///modules/ssmtp/ssmtp.conf",
	content => template("ssmtp/ssmtp_config.erb"),
	require => Class["ssmtp::install"],
	}
}



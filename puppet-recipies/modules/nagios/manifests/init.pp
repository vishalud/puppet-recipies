class nagios { 
	user { "nagios":
		ensure => present,
	}
	
	package { ["nagios-plugins", "nagios-nrpe", "xinetd"]:
		ensure => present,
	}
	file { "/opt/nagios/libexec":
		ensure => link,
		target => "/usr/lib64/nagios/plugins",
		require => File["/opt/nagios"]
	}
	file { "/opt/nagios":
		ensure => directory,
	}
	file { "/etc/nagios/nrpe.cfg":
                source  => "puppet:///modules/nagios/nrpe.cfg",
                ensure  => present,
                mode    => "755",
                group   => "nagios",
                owner   => "nagios",
        }
	exec { "/bin/echo 'nrpe 5666/tcp' >> /etc/services":
		unless	=> "/bin/grep nrpe /etc/service 2>/dev/null",
	}
}



class nagios::checks {
	file { "/usr/lib64/nagios/plugins/check_mem":
		source 	=> "puppet:///modules/nagios/check_mem",
		ensure 	=> present,
		mode	=> "755",	
		group 	=> "nagios",
		owner 	=> "nagios",
		require =>  Class["nagios"]
	}	
	file { "/usr/lib64/nagios/plugins/check_all_disks":
        	source => "puppet:///modules/nagios/check_all_disks",
        	ensure => present,
        	mode => "755",
       		group => "nagios",
        	owner => "nagios",
		require =>  Class["nagios"],
		
	}		
	file { "/usr/lib64/nagios/plugins/check_daemon":
        	source => "puppet:///modules/nagios/check_daemon",
        	ensure => present,
        	mode => "755",
       		group => "nagios",
		require =>  Class["nagios"],
        	owner => "nagios",
	}
	file { "/usr/lib64/nagios/plugins/check_3ware_raid":
        	source => "puppet:///modules/nagios/check_3ware_raid",
        	ensure => present,
        	mode => "755",
       		group => "nagios",
		require =>  Class["nagios"],
        	owner => "nagios",
	}
}




class nagios::xinetd {
	service { xinetd:
        	ensure => running,
        	subscribe => File["/etc/xinetd.d/nrpe"],
		require => Package["xinetd"],
	}
	file { "/etc/xinetd.d/nrpe":
		ensure => present,
		require =>  Class["nagios"],
      		source => ["puppet:///modules/nagios/xinetd-nrpe"],
	}		
}

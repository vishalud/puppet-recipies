class xen::ssh::key { 
	file { "/root/.ssh/authorized_keys":
	ensure => present,
	mode => "644",
	group => "root",
	owner => "root",
  }

	exec { "/bin/echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAx8joHFPDK8R2kP3O5u2IuwoZHtEEkTluMjy2IQAZ/5k2/xQglJC3UrUGbqQzaRDNTv8WzrOmN7hycf+csEasoavgxlrqXATGGjjQxqPb5hgkcQBeYCFmVCc8lR2wRb6vMp03KJz30jUN2Q2R7MSAOD18MAVA64qI2QxB/NWbE/zKSVSbOxTA8bchvY3lJ1MsbezTWAj3sTVKo0lWshCRlCMrzARXAhZXraWanHDC6LVwOA4TJeB3OTx0CLtbxYPEcTsgLtZH6jRFhSN6pMVN006mNPumYTDoCYg1MzU2xZiP1RzHOoqpVeTBLihGxjD5u9Ii/9HDphajQfCIPqM6dQ== root@MSPDINMS' >> /root/.ssh/authorized_keys":
		unless => "/bin/grep NMS /root/.ssh/authorized_keys 2>/dev/null",
	}
}

class xen::checks { 
	file { "/opt/scripts":
	ensure => directory,
	}

	file { "/opt/scripts/check_3ware.sh":
	source => "puppet:///modules/xen/check_3ware.sh",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}


	file { "/opt/scripts/check_disk.pl":
	source => "puppet:///modules/xen/check_disk.pl",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}

	
	file { "/opt/scripts/check_disk.sh":
	source => "puppet:///modules/xen/check_disk.sh",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}
		
	file { "/opt/scripts/check_disk_stats":
	source => "puppet:///modules/xen/check_disk_stats",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}


	file { "/opt/scripts/check_load.pl":
	source => "puppet:///modules/xen/check_load.pl",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}


	file { "/opt/scripts/free_mem.pl":
	source => "puppet:///modules/xen/free_mem.pl",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}
  }



class xen::backup { 
	
	
	file { "/opt/scripts/vm_backup.cfg":
	source => "puppet:///modules/xen/vm_backup.cfg",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}



	file { "/opt/scripts/vm_backup.lib":
	source => "puppet:///modules/xen/vm_backup.lib",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}

	
	file { "/opt/scripts/vm_backup.sh":
	source => "puppet:///modules/xen/vm_backup.sh",
	ensure => present,
	mode => "755",
	group => "root",
	owner => "root",
	require => Class["xen::ssh::key"],
	}
  }

class xen::cron { 
	file { "/var/spool/cron/root":
	ensure => present, 
	mode => "644",
	owner => "root",
	group => "root",
	source => "puppet:///modules/xen/xen.cron",
	require => Package["logrotate"],
	}
 }



#Defining classes from here 
class base {
	include networking::resolver, ntp, ssh, users::t-syseng
	#package {["sysstat", "sar", "snmpd", "bacula-client", "traceroute", "mtr"]:
         #       ensure => latest,
        }
class xenserver {
	include networking::resolver, ntp, ssh, users::t-syseng, logrotate
}

#Define all nodes from here .Place in appropriate classes 
node 'mstcrmysqlssd.internal.directi.com'{ 
    include base, logrotate, nagios::xinetd, nagios::checks, nagios
}

node 'mspdicitrix1.internal.directi.com','mssdicitrix2.internal.directi.com','mssdicitrix3.internal.directi.com','mspdicitrix4.internal.directi.com','mssdicitrix5.internal.directi.com','mspdicitrix-6.internal.directi.com','mspdicitrix-7.internal.directi.com'{
	include xenserver 
}
#node 'mssdicitrix2.internal.directi.com'{
#	include xenserver 
#}

#node 'mssdicitrix3.internal.directi.com'{
#}

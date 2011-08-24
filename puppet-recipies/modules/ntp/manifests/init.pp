class ntp {

package { ntp:
        ensure => latest,
        before => File["/etc/ntp.conf"]
}
service { ntpd:
        ensure => running,
        subscribe => File["/etc/ntp.conf"]
}
file { "/etc/ntp.conf":
      ensure => present,
      source => ["puppet:///modules/ntp/ntp.conf"]
   }
}



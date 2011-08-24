class networking {
}
 
class networking::resolver inherits networking { 
          file { "/etc/resolv.conf": 
              ensure => present,
              source => "puppet:///modules/networking/resolv.conf",
              group   => "root",
              owner => "root",
              mode  => "0644"
          }
}

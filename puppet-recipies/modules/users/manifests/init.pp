# Class: users
#
# This class sets up users (useradd/userdel)
#
class users {
  # define installshell($shell, $ensure = latest) {
  #   package { "$shell":
  #     ensure => $ensure;
  #   }
  # }
  
  define adduser($username, $groupname, $shell="/sbin/nologin", $ensure, $login=false, $key) {
    if ($groupname == $username) {
      group {
        "$groupname":
	  ensure => $ensure
      }
    }

    if $shell == "/sbin/nologin" {
      user {
        "$username":
          ensure => $ensure,
          gid => $groupname,
          shell => "/sbin/nologin",
      }
    } else {
      user {
        "$username":
          ensure   => $ensure,
          gid      => $groupname,
          shell    => $operatingsystem ? {
            "CentOS" => "/bin/${shell}",
            "RedHat" => "/bin/${shell}",            
            "Solaris" => "/usr/bin/${shell}", # this might work only for bash.
	    default => "/bin/${shell}",
          },
          home => $operatingsystem ? {
            "CentOS" => "/home/${username}",
            "RedHat" => "/home/${username}",
            "Solaris" => "/usr/home/${username}",
	    default => "/home/${username}",
          },
          password => $operatingsystem ? {
            "Solaris" => 'NP',
            default => undef,
      
          },
            managehome => true,            
      }
    }
  
  file { "/home/$username/.ssh":
          ensure => directory,
          owner => $username,
          group => $groupname,
          mode => 700,
          require => User["$username"]
}
  file { "/home/$username/.ssh/authorized_keys":
          ensure => present,
          owner => $username,
          group => $groupname,
          mode => 700,
          require => File["/home/$username/.ssh"],
          content => $key
          
}

     }          
  file { "/etc/sudoers":
        owner => root,
        group => root,
        mode => 440,
        source => "puppet:///modules/users/sudoers"
    	}
} 

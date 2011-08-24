class ocsinventory {
  package { "perl-XML-Parser": ensure => installed }
  package { "ocsinventory-agent": ensure => installed, require => Package["perl-XML-Parser"] }

  cron { "ocsinventory":
    command => "/usr/sbin/ocsinventory-agent --server=http://122.182.0.38:1700/ocsinventory",
    user    => root,
    hour    => 2,
    minute  => 0,
    require => Package["ocsinventory-agent"]
  }
}

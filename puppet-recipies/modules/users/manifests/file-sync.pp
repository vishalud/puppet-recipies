# Class: users::file-sync
#   Sets up syncing of dot-files to production servers via rsync
#   (.ssh/authorized_files, .bashrc, etc.)
#
# Parameters:
#   none
#
# Actions:
#   Sets up the sync-user-fils.sh script in /usr/local/sbin
#   And installs cron entry to sync every 3rd hour
#
# Requires:
#   Class["users::addusers"]
#
# Sample Usage:
#   include users::file-sync
#
class users::file-sync {
  file { "/usr/local/sbin/sync-user-files.sh":
    owner => root, group => root, mode => 755,
    source => 'puppet:///modules/users/sync-user-files.sh'
  }
  cron { "sync-user-files":
    command => '/usr/local/sbin/sync-user-files.sh 1>/dev/null',
    user => 'root',
    minute => fqdn_rand(59),
    hour => '*/3',
    ensure => present,
    require => File['/usr/local/sbin/sync-user-files.sh'];
  }
}

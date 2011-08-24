import "nodes.pp"
$puppetserver = 'puppet-master.internal.directi.com' 
filebucket { main: server => puppet }

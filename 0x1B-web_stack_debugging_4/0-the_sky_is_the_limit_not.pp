# Fix inabilty of server to handle many concurrent request

$file = '/etc/default/nginx'

exec { 'increase limit':
  command => "sed -i 's/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/g' ${file}",
  path    => ['/bin', '/usr/bin']
}

exec { 'restart nginx':
  require => Exec['increase limit'],
  command => 'service nginx restart',
  path    => ['/bin', '/usr/bin']
}

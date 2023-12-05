# install and configure nginx using puppet

exec { 'update packages':
  command  => 'sudo apt-get update',
  provider => shell
}

package { 'nginx':
  ensure => 'installed',
  name   => 'nginx'
}

file { '/var/www/html/index.html':
  content => 'Hello World!'
}

file_line { 'setup custom http response header':
  ensure => present,
  path   => '/etc/nginx/nginx.conf',
  line   => "\n\tadd_header X-Served-By ${hostname}",
  after  => 'http {'
}

exec { 'restart nginx':
  command  => 'sudo service nginx restart',
  provider => shell
}

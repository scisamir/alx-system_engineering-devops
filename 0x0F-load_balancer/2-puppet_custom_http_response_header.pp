# install and configure nginx using puppet

package { 'nginx':
  ensure => 'installed'
}

exec { 'install nginx and update packages':
  command  => 'sudo apt-get update; sudo apt-get -y install nginx',
  provider => shell
}

file { '/var/www/html/index.html':
  content  => 'Hello World!'
}

file_line { 'setup custom http response header':
  ensure => present,
  path   => '/etc/nginx/nginx.conf',
  line   => "\n\tadd_header X-Served-By ${hostname}",
  after  => 'http {'
}

service { 'nginx':
  ensure => 'running'
}

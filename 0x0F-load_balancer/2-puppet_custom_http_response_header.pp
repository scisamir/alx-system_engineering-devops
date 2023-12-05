# install and configure nginx using puppet

exec { 'update packages':
  command  => 'sudo apt-get -y update',
  provider => shell
}

package { 'nginx':
  ensure  => 'installed',
  name    => 'nginx',
  require => Exec['update packages']
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Package['nginx']
}

exec { 'setup custom http response header':
  command  => "sed -i '/http {/a \\\n\\tadd_header X-Served-By ${hostname};' /etc/nginx/nginx.conf",
  provider => shell,
  require => Package['nginx']
}

exec { 'restart nginx':
  command  => 'sudo service nginx restart',
  provider => shell,
  require  => Exec['setup custom http response header']
}

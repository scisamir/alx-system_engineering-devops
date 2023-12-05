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

exec { 'setup custom http response header':
  command  => 'sed -i "/http {/a \\\n\tadd_header X-Served-By $HOSTNAME;" /etc/nginx/nginx.conf',
  provider => shell
}

exec { 'restart nginx':
  command  => 'sudo service nginx restart',
  provider => shell
}

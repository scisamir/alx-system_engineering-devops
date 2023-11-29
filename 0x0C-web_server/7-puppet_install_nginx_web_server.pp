# install and configure nginx using puppet

package { 'nginx':
  ensure => 'present'
}

exec { 'install nginx and update packages':
  command  => 'sudo apt-get update; sudo apt-get -y install nginx',
  provider => shell
}

exec { 'Hello World':
  command  => 'sudo ufw allow "Nginx HTTP"; echo "Hello World!" > /var/www/html/index.html',
  provider => shell
}

exec { 'perform redirection':
  command  => 'sudo sed -i "/listen 80 default_server/a rewrite ^/redirect_me https://github.com permanent;" /etc/nginx/sites-available/default',
  provider => shell
}

exec { 'restart nginx':
  command  => 'sudo service nginx restart',
  provider => shell
}

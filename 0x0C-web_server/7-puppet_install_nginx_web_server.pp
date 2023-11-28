# install and configure nginx using puppet

package { 'nginx'
  ensure => 'installed'
}

exec { 'install nginx and update packages'
  command => 'sudo apt-get update; sudo apt-get -y install nginx'
}

exec { 'Hello World'
  command => 'sudo ufw allow 'Nginx HTTP; echo "Hello World!" > /var/www/html/index.html'
}

exec { 'perform redirection'
  command => 'sudo sed -i "/listen 80 default_server/a rewrite ^/redirect_me https://github.com permanent;" /etc/nginx/sites-available/default'
}

exec { 'restart nginx'
  command => 'sudo service nginx restart'
}

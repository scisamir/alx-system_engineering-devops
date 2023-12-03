# Install a package

package { 'python3-pip':
  ensure => 'installed'
}

exec { 'install flask':
  command => 'pip3 install Flask==2.1.0',
  require => Package['python3-pip']
}

exec { 'update werkzeug':
  command => 'pip3 install --upgrade werkzeug',
  require => Package['python3-pip']
}

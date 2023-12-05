# Install a package

package { 'python3-pip':
  ensure => 'installed'
}

exec { 'upgrade pip':
  command => 'pip3 install --upgrade pip',
  path    => '/usr/local/bin/',
  require => Package['python3-pip']
}

exec { 'install flask':
  command => 'pip3 install Flask==2.1.0',
  path    => '/usr/local/bin/',
  require => [ Package['python3-pip'], Exec['upgrade pip'] ]
}

exec { 'update werkzeug':
  command => 'pip3 install --upgrade werkzeug',
  path    => '/usr/local/bin/',
  require => Package['python3-pip']
}

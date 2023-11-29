# Install a package

package { 'python3-pip':
  ensure => 'installed'
}

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip']
}

exec { 'update werkzeug':
  command => 'pip3 install --upgrade werkzeug',
  require => Package['python3-pip']
}

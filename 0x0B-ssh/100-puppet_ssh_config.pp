# Client configuration file (w/ Puppet)

file_line { 'add private key'
	ensure => 'present',
	path   => '/etc/ssh/ssh_config',
	line   => '	IdentityFile ~/.ssh/school'
}

file_line { 'allow auth with no password'
        ensure => 'present',
        path   => '/etc/ssh/ssh_config',
        line   => '	PasswordAuthentication no'
}

# Client configuration file (w/ Puppet)

file { '/etc/ssh/ssh_config'
	ensure  => present
	content => '# Client configuration file
Host *
        IdentityFile ~/.ssh/school
        PasswordAuthentication no'
}

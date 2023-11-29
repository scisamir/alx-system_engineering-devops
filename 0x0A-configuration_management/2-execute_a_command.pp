# Execute a command

exec { 'kill process killmenow':
  command => 'pkill -f killmenow',
  path    => '/usr/bin'
}

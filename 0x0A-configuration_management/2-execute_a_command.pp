# Execute a command

exec { 'kill process killmenow':
  command => 'pkill killmenow'
  path    => '/usr/bin'
}

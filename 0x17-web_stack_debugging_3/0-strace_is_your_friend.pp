# This puppet mainfest uses edits a wordpress configuration file in an attempt
# 	to fix the `500 internal server error`

$file = '/var/www/html/wp-settings.php'

exec { 'fix_file_ext':
  command => "sed -i 's/class-wp-locale.phpp/class-wp-locale.php/g' ${file}",
  path    => ['/bin', '/usr/bin', '/usr/sbin']
}

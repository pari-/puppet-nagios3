class nagios3::params {
  $ensure = 'present'
  $auto_upgrade = false
  $service_ensure = 'running'
  $service_enable = true

  $enable_check_external_commands = true
  $disable_log_passive_checks = true

  case $::operatingsystem {
    'Debian': {
      $package = [ 'nagios3' ]
      $config = '/etc/nagios3/nagios.cfg'
      $service_name = 'nagios3'
      $nagios_group = 'nagios'
    }
    default: {
      fail("\"${module_name}\" is not supported on \"${::operatingsystem}\"")
    }
  }

}

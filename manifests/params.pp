class nagios3::params {
  $ensure = 'present'
  $auto_upgrade = false
  $service_ensure = 'running'
  $service_enable = true

  $enable_check_external_commands = false
  $disable_log_passive_checks = false

  case $::operatingsystem {
    'Debian': {
      $package = [ 'nagios3' ]
      $config = '/etc/nagios3/nagios.cfg'
      $service_name = 'nagios3'
    }
    default: {
      fail("\"${module_name}\" is not supported on \"${::operatingsystem}\"")
    }
  }

}

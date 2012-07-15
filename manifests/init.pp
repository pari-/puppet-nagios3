class nagios3 (
  $ensure                         = $nagios3::params::ensure,
  $package                        = $nagios3::params::package,
  $auto_upgrade                   = $nagios3::params::auto_upgrade,
  $config                         = $nagios3::params::config,
  $service_name                   = $nagios3::params::service_name,
  $service_ensure                 = $nagios3::params::service_ensure,
  $service_enable                 = $nagios3::params::service_enable,
  $enable_check_external_commands = $nagios3::params::enable_check_external_commands,
  $disable_log_passive_checks     = $nagios3::params::disable_log_passive_checks,
  $nagios_group                   = $nagios3::params::nagios_group
) inherits nagios3::params {

  class {'nagios3::package':}
  class {'nagios3::config':}
  class {'nagios3::service':}

  if $ensure == 'present' {
    Class['nagios3::package'] -> Class['nagios3::config'] ~> Class['nagios3::service']
  } else {
    Class['nagios3::service'] -> Class['nagios3::package']
  }
}

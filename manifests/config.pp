class nagios3::config {

  if $nagios3::enable_check_external_commands {
    augeas {'enable_check_external_commands':
      context => "/files/$nagios3::params::nagios3_config",
      changes => [
        'set check_external_commands 1',
      ],
    }
  }

  if $nagios3::disable_log_passive_checks {
    augeas {'disable_log_passive_checks':
      context => "/files/$nagios3::params::nagios3_config",
      changes => [
        'set log_passive_checks 0',
      ],
    }
  }

  exec {'enable_webserver_write_access_1':
    command => 'dpkg-statoverride --update --add nagios www-data 2710 /var/lib/nagios3/rw',
    path    => '/usr/bin',
    onlyif  => 'test `stat -c \'%a\' /var/lib/nagios3/rw` -ne 2710',
  }
  exec {'enable_webserver_write_access_2':
    command => 'dpkg-statoverride --update --add nagios nagios 751 /var/lib/nagios3',
    path    => '/usr/bin',
    onlyif  => 'test `stat -c \'%a\' /var/lib/nagios3` -ne 751',
  }

  user {'www-data':
    ensure  => present,
    groups  => nagios,
  }

}


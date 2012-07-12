class nagios3::service {
  service {$nagios3::service_name:
    ensure     => $nagios3::service_ensure,
    enable     => $nagios3::service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}

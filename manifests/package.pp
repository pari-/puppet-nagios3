class nagios3::package {
  if $nagios3::ensure == 'present' {
    $package_ensure = $nagios3::auto_upgrade ? {
      true  => 'latest',
      false => 'installed',
    }
  } else {
    $package_ensure = 'purged'
  }

  package {$nagios3::package:
    ensure          => $package_ensure,
    provider        => 'aptbpo',
    install_options => { '-t' => 'squeeze-backports' },
  }
}

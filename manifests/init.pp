class clients_ntp_configuration {

  file { [ '/etc/systemd/timesyncd.conf.d' ]:
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }
  -> file { [ '/etc/NetworkManager', '/etc/NetworkManager/dispatcher.d' ]:
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }

  file { '/etc/NetworkManager/dispatcher.d/10-update-timesyncd':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/clients_ntp_configuration/10-update-timesyncd',
    require => File['/etc/NetworkManager/dispatcher.d'],
    notify => Exec['Restart NetworkManager'],
  }

  exec { 'Restart NetworkManager':
    command     => '/usr/bin/systemctl restart NetworkManager.service',
    refreshonly => true,        # only runs if file changed
  }
}

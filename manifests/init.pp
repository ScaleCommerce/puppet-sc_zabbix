# == Class: sc_zabbix
#
# Module to install Zabbix the ScaleCommerce way.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*use_supervisor*]
#   can be true or false, default is true.
#   determines if start script should be used with supervisor
#
# === Examples
#
#  class { 'dummy':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# ScaleCommerce <info@scale.sc>
#
# === Copyright
#
# Copyright 2016 ScaleCommerce GmbH
#
class sc_zabbix(
  $use_supervisor = true,
) {

  if $use_supervisor {

    class {'::sc_zabbix::supervisor':}

  }

  package {'zabbix-get':
    ensure => installed,
  }
  package {'zabbix-sender':
    ensure => installed,
  }
  file {'/usr/bin/get_cpu_used':
    source => 'puppet:///modules/sc_zabbix/get_cpu_used',
  }

}

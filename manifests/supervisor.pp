class sc_zabbix::supervisor(){

  include sc_supervisor

  file { "${supervisord::config_include}/zabbix-agent.conf":
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/zabbix-agent-supervisor.conf.erb"),
    notify => Class[supervisord::reload],
  }

}
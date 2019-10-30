class profile::base_ubuntu {
  include profile::clamav
  include os_patching
  include zabbix::agent
  class { 'zabbix::agent':
  zabbix_version => '3.0',
  server => '172.27.3.27',
}

}

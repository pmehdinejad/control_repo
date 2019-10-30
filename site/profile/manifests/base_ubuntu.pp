class profile::base_ubuntu {
  include profile::clamav
  include os_patching
  class { 'zabbix::agent':
  zabbix_version => '3.0',
  server => '172.27.3.27',
  zabbix_package_state => 'installed
}

}

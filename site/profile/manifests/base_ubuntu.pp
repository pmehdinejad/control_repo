class profile::base_ubuntu {
  include profile::clamav
  include os_patching
  include zabbix::agent
}

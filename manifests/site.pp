node default {
}
node 'puppet-server.cloudacropolis.com' {
  include role::master_server
  }
node 'puppet-agent.cloudacropolis.com' {
  include profile::base-ubuntu
}

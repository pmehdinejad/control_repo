node default {
}
node 'puppet-server.cloudacropolis.com' {
  include role::master_server
}
node 'puppet-agent.cloudacropolis.com' {
  include role::agent_node
}

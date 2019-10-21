class profile::agent_nodes{
  include dockeragent
  dockeragent::node { 'docker.puppet.vm': }
  dockeragent::node { 'docker2.puppet.vm': }
}

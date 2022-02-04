# @api private
class snowagent::config {
  file { '/opt/snow/snowagent.config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('snowagent/snowagent.config.epp'),
  }
}

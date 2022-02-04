# @api private
class snowagent::config {
  file { '/opt/snow/snowagent.config':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('snowagent/snowagent.config.epp'),
  }
}

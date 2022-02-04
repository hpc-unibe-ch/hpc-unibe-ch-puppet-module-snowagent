# @api private
class snowagent::install {
  $package_url  = "${snowagent::snowagent_baseurl}unibe_snowagent-${snowagent::snowagent_version}.x86_64.rpm"
  $package_name = 'snowagent'

  package { $package_name:
    ensure   => present,
    provider => 'rpm',
    source   => $package_url,
  }
}

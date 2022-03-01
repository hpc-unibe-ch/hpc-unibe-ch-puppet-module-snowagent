# @summary Install and configure the SAM client used at university
#
# Currently this module installs snowagent, the SAM client that is used at the
# University of Bern.
#
# @example
#   include snowagent
class snowagent (
  Optional[String] $snowagent_sitename,
  Optional[String] $snowagent_endpoint,
  Optional[String] $snowagent_loglevel,
  Optional[String] $snowagent_baseurl,
  Optional[String] $snowagent_version,
  Optional[Array[String]] $snowagent_excludes,
  Boolean $snowagent_add_kill_cron,
) {
  $osfamily = fact('os.family')
  $osmajor = fact('os.release.major')
  $os = "${osfamily}-${osmajor}"
  $supported = ['RedHat-7','RedHat-8']
  if ! ($os in $supported) {
    fail("Unsupported OS: ${os}, module ${module_name} only supports RedHat 7 and 8")
  }

  contain snowagent::install
  contain snowagent::config

  if $snowagent_add_kill_cron {
    contain snowagent::kill_cron
  }

  Class['snowagent::install'] -> Class['snowagent::config']
}

# @private
class snowagent::kill_cron {
  cron::job { 'kill_snowagent_run':
    minute      => 05,
    hour        => 21,
    date        => '*',
    month       => '*',
    weekday     => '*',
    user        => 'root',
    command     => 'pkill -f snowagent',
    environment => [ 'MAILTO=root', 'PATH="/usr/bin:/bin"', ],
    description => 'Kill all snowagent runs older than 5 minutes',
  }
}

#
# == Class gluster::service
#
# manage the glusterd service
#
# === Parameters
#
# ensure: whether or not to run the glusterd service
#
# === Examples
#
# class { gluster::service:
#   ensure => running,
# }
#
# === Authors
#
# Scott Merrill <smerrill@covermymeds.com>
#
# === Copyright
#
# Copyright 2014 CoverMyMeds, unless otherwise noted
#
class gluster::service (
  $ensure = $::gluster::params::service_ensure,
  $enable = $::gluster::params::service_enable,
  $service = $::gluster::params::service_name,
) {

  service { $service :
    ensure     => $ensure,
    enable     => $enable,
    hasrestart => true,
    hasstatus  => true,
  }
}

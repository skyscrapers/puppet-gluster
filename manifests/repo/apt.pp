#
# == Class gluster::repo::yum
#
# enable the upstream Gluster Yum repo
#
# === Parameters
#
# version: the version to use when building the repo URL
# repo_key_name: the filename of this repo's GPG key
# repo_key_path: the path to this repo's GPG key on the target system
# repo_key_source: where to find this repo's GPG key
# priority: YUM priority to set for the Gluster repo
#
# Currently only released versions are supported.  If you want to use
# QA releases or pre-releases, you'll need to edit line 54 below

# === Examples
#
# Enable the Yum repo, and use the public key stored in a local module
# called "secure":
#
# class { gluster::repo::yum:
#   repo_key_source => 'puppet:///modules/secure/gluster-repo-rpm-key',
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
class gluster::repo::apt (
  $version         = $::gluster::params::version,
) {

  # basic sanity check
  if ! $version {
    fail ('Version not specified: unable to define repo!')
  }

  if !defined(Class['::apt']) {
    class { '::apt': }
  }

  ::apt::ppa { 'ppa:gluster/glusterfs-3.5': }
}

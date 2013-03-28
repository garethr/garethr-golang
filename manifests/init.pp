# == Class: golang
#
# Module to install an up-to-date version of Go from the
# official PPA. The use of the PPA means this only works
# on Ubuntu.
#
# === Parameters
# [*version*]
#   The package version to install, passed to ensure.
#   Defaults to present.
#
# [*package_name*]
#   Which package you want. Valid values are golang-weekly,
#   golang-tip and golang-stable. Defaults to golang-stable.
#
class golang(
  $version = 'present',
  $package_name = 'golang-stable',
) {
  include apt
  validate_re($package_name, '^golang-(stable|weekly|tip)$')
  validate_string($version)
  validate_re($::osfamily, '^Debian$', 'This module uses PPA repos and only works with Debian based distros')

  package { 'system-golang':
    ensure => 'absent',
    name   => 'golang',
  }

  apt::ppa { 'ppa:gophers/go':
    require => Package['system-golang'],
  }

  package { 'new-golang':
    ensure  => $version,
    name    => $package_name,
    require => Apt::Ppa['ppa:gophers/go'],
  }
}

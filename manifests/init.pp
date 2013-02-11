# == Class: subversion
#
# This puppet module install subversion (svn) package
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { subversion:
#  }
#
# === Authors
#
# LStuker <lucien.stuker@gmail.com>
#
# === Copyright
#
# Copyright 2013 Lucien Stuker.
#
class subversion() inherits subversion::params {

  package { 'subversion':
    name      => $git_package_name,
    ensure    => $ensure,
  }

}


# == Class: subversion
#
# This puppet module install subversion (svn) package
#
# === Parameters
#   [*ensure*]
#     Ensure if present or absent.
#     Default: present
#
#   [*autoupgrade*]
#     Upgrade package automatically, if there is a newer version.
#     Default: false
#
#   [*package*]
#     Name of the package.
#     Only set this, if your platform is not supported or you know,
#     what you're doing.
#     Default: auto-set, platform specific
#
#   [*package_provider*]
#     Name of the package provider.
#     Default: auto-set, platform specific
#
# === Examples
#
#  class { subversion:
#  }
#
#  class { subversion:
#   autoupgrade => true,
#  }
#
#
# === Authors
#
# LStuker <lucien.stuker@gmail.com>
#
# === Copyright
#
# Copyright 2013 Lucien Stuker.
#
class subversion(
  $ensure              = 'present',
  $autoupgrade         = false,
  $package             = $subversion::params::package,
  $package_provide     = $subversion::params::package_provide,
) inherits subversion::params {

    case $ensure {
    /(present)/: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  package { $package:
    ensure          => $package_ensure,
    package_provide => $package_provide,
  }

}


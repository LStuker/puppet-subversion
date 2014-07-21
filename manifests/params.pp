# Class: subversion::params
#
#   The git configuration settings.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#

class subversion::params {
  case $::osfamily {
    redhat: {
      $package = 'subversion'
    }
    debian: {
      $package = 'subversion'
    }
    suse: {
      $package = 'subversion'
    }
    solaris: {
      case $::kernelrelease {
        '5.11': {
          $package = 'pkg://solaris/developer/versioning/subversion'
        }
        '5.10': {
          $package         = 'CSWsvn'
          $package_provide = 'pkgutil'
        }
      }
    }
    default: {
      warning("Module 'subversion' is not currently supported on ${::operatingsystem}")
    }
  }
}

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
      case $::operatingsystemrelease {
        '11.1', '11.2', '11.3', '11.4': {
          warning("Module 'subversion' is not currently supported on ${::operatingsystem}")
        } default :{
          $package = 'subversion'
        }
      }
    }
    solaris: {
      case $::kernelrelease {
        '5.11': {
          $package = 'pkg://solaris/developer/versioning/subversion'
        }
        '5.10': {
          $package          = 'CSWsvn'
          $package_provider = 'pkgutil'
        }
      }
    }
    default: {
      warning("Module 'subversion' is not currently supported on ${::operatingsystem}")
    }
  }
}

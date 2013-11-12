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
    solaris: {
      case $::kernelrelease {
        '5.11': {
          $package = 'subversion'
        }
        '5.10': {
          $package = 'SFWsubversion'
        }
      }
    }
    default: {
      warning("Module 'subversion' is not currently supported on ${::operatingsystem}")
    }
  }
}

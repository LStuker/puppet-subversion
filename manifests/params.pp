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
    'redhat','debian': {
      $svn_package_name = 'subversion'
    }
    default: {
      fail("Module 'subversion' is not currently supported on ${::operatingsystem}")
    }
  }
}

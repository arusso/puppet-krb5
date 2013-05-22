# == Class: krb5::k5start::install
#
# Installs the necessary packages for k5start
#
class krb5::k5start::install {
  $packages = [ 'kstart', 'runcon' ]
  package { $packages: ensure => installed }
}

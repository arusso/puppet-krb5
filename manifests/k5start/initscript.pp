define krb5::k5start::initscript (
  $owner       = undef,
  $group       = undef,
  $minutes     = 60,
  $options     = undef,
  $keytab      = undef,
  $use_selinux = true,
  $filemode    = '600',
) {
  include krb5::k5start

  $owner_r = $owner
  $group_r = $group
  $minutes_r = $minutes
  $options_r = $options
  $keytab_r = $keytab
  $name_r = $owner

  file { "/etc/init.d/k5start-${name_r}":
    ensure  => present,
    mode    => '0550',
    owner   => root,
    group   => root,
    content => template('krb5/k5start.init.erb'),
  }
}

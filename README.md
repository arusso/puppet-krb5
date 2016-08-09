# krb5/k5start


## generate a cache file file only usable for the specifed user : 

basicaly requires /home/vfoucault/vfoucault.keytab to be existant as long a the user

```puppet
krb5::k5start::initscript { 'vfoucault_k5start':
  owner       => 'vfoucault',
  keytab      => '/home/vfoucault/vfoucault.keytab',
  use_selinux => false,
  notify      => Service["k5start-vfoucault"],
  require     => File['/home/vfoucault/vfoucault.keytab']
}

file { '/home/vfoucault/vfoucault.keytab':
  ensure => present
}

service { 'k5start-vfoucault':
  ensure => running,
  require => File['/home/vfoucault/vfoucault.keytab']
}
```


## other settings : 

* ```use_selinux```: Can be ```true``` of ```false``` default to ```true``` : Do we have selinux enabled on the target systems ?
* ```group```: a optional group name to replace the owner default group.
* ```mode```: Set ticket cache permissions to <mode> (octal). default to 600.
* ```tkt_lifetime``` : Set the ticket cache lifetime. Cannot be greater than the max_lifetime kerberos setting. should be <int><unit>, lake "1d", "12h" and so on. 

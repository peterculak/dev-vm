exec { 'apt-get update':
  path => '/usr/bin',
}

service { 'apache2':
  ensure => stopped,
}

package { "apache2":
  ensure => absent,
}

exec { "remove-apache-dependencies":
  command => "/usr/bin/apt-get -y autoremove",
  subscribe => Package["apache2"],
  refreshonly => true,
}

package { 'vim':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}

include nginx, php, mysql, composer, git
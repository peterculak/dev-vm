# vagrant/puppet/modules/php/manifests/init.pp
class php {

  # Install the php5-fpm and php5-cli packages
  package { ['php5-fpm',
             'php5-cli']:
    ensure => present,
    require => Exec['apt-get update'],
  }

  # Make sure php5-fpm is running
  service { 'php5-fpm':
    ensure => running,
    require => Package['php5-fpm'],
  }

  exec { "php5-curl":
    command => 'sudo apt-get install -y php5-curl',
    path    => '/usr/bin:/usr/sbin',
    require => Package['php5-fpm']
  }

  exec { "php5-mysql":
    command => 'sudo apt-get install -y php5-mysql',
    path    => '/usr/bin:/usr/sbin',
    require => Package['php5-fpm']
  }
}
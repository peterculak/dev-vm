# vagrant/puppet/modules/git/manifests/init.pp
class git {

  # Install git
  package { ['git']:
    ensure => present,
    require => Exec['apt-get update'],
  }
}
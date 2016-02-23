class my_java {

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    require => Apt::Ppa['ppa:webupd8team/java'],
  } ->

  exec { 'accept_license':
    command   => 'echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections',
    cwd       => '/root',
    user      => 'root',
    path      => '/usr/bin/:/bin/',
    logoutput => true,
  } ->

  package { 'oracle-java8-installer':
    ensure  => present,
  } ->

  package { 'oracle-java8-set-default':
    ensure => present,
  }
}

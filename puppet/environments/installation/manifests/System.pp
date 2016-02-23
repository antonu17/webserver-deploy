class my_system {

  user { 'developer':
    groups           => ['sudo'],
    home             => '/home/developer',
    password         => pw_hash('1q2w3e4r', 'SHA-512', 'yvf9714yr'),
    shell            => '/bin/bash',
    managehome       => true
  } ->

  file { "/etc/localtime":
    ensure => link,
    target => "/usr/share/zoneinfo/Europe/Moscow",
  }
}
class my_finish {

  exec { 'composer global require "fxp/composer-asset-plugin:~1.1.1"':
    path        => '/usr/bin:/usr/local/bin',
    user        => 'developer',
    environment => ['HOME=/home/developer'],
    creates     => '/home/developer/.config/composer/vendor/fxp/composer-asset-plugin/composer.json',
  }

  file { '/var/log/php-fpm':
    mode => '777',
  }

  file { '/var/log/php-fpm/error.log':
    mode => '644',
  }
}
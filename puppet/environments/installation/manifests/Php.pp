class my_php(
  $php_ini = '/etc/php.ini',
  $xdebug_ini = '/etc/php.d/xdebug.ini',
  $php_fpm_www_conf = '/etc/php-fpm/pool/www.conf'
) {

  class { 'php':
    require        => Apt::Ppa['ppa:ondrej/php5'],
    package_prefix => 'php5-',
    fpm            => true,
  }

  php::extension { 'mysql': }
  php::extension { 'pgsql': }
  php::extension { 'gd': }
  php::extension { 'mcrypt': }
  php::extension { 'geoip': }
  php::extension { 'intl': }
  php::extension { 'imagick': }
  php::extension { 'memcache': }
  php::extension { 'apcu': }
  php::extension { 'xdebug': }
  php::extension { 'curl': }

  php::config::setting { 'Date/date.timezone':
    file  => $php_ini,
    key   => 'Date/date.timezone',
    value => 'Europe/Moscow',
  }

  php::config::setting { 'PHP/expose_php':
    file  => $php_ini,
    key   => 'PHP/expose_php',
    value => 'Off',
  }

  php::config::setting { 'log_errors':
    file   => $php_fpm_www_conf,
    key    => 'www/php_admin_flag[log_errors]',
    value  => 'on',
    notify => Service['php5-fpm'],
  }

  php::config::setting { 'error_log':
    file   => $php_fpm_www_conf,
    key    => 'www/php_admin_value[error_log]',
    value  => '/var/log/php-fpm/www-error.log',
    notify => Service['php5-fpm'],
  }

  php::config::setting { 'xdebug/remote_enable':
    file    => $xdebug_ini,
    key     => 'xdebug/xdebug.remote_enable',
    value   => 'true',
  }

  php::config::setting { 'xdebug/remote_host':
    file    => $xdebug_ini,
    key     => 'xdebug/xdebug.remote_host',
    value   => '192.168.33.1',
  }

  php::config::setting { 'xdebug/remote_port':
    file    => $xdebug_ini,
    key     => 'xdebug/xdebug.remote_port',
    value   => '9000',
  }

  php::config::setting { 'xdebug/remote_autostart':
    file    => $xdebug_ini,
    key     => 'xdebug/xdebug.remote_autostart',
    value   => 'true',
  }

  php::config::setting { 'xdebug/idekey':
    file    => $xdebug_ini,
    key     => 'xdebug/xdebug.idekey',
    value   => 'PhpStorm',
  }

}

stage { 'last': }
Stage['main'] -> Stage['last']

include my_apt
include my_system

class { 'my_php':
  php_ini          => '/etc/php5/fpm/php.ini',
  xdebug_ini       => '/etc/php5/mods-available/xdebug.ini',
  php_fpm_www_conf => '/etc/php5/fpm/pool.d/www.conf'
}

include my_nginx
include my_mysql
include my_java
include my_elasticsearch
include my_nodejs
include my_firewall
include my_redis
include my_memcached

class { 'my_finish':
  stage => last
}

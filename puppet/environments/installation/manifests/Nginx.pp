class my_nginx {
  class{ 'nginx':
    require => Apt::Ppa['ppa:nginx/stable'],
  }

  nginx::resource::vhost{ '_':
    name        => 'default',
    www_root    => '/var/www/html',
    try_files   => ['$uri', '$uri/', '=404'],
    index_files => ['index.php', 'index.html', 'index.nginx-debian.html'],
    locations   => {
      locations => {
        location           => '~ \.php$',
        index_files        => ['index.php'],
        try_files          => ['try_files', '$uri', '=404'],
        fastcgi            => '127.0.0.1:9000',
        fastcgi_param      => {
          'SCRIPT_FILENAME' => '$document_root/$fastcgi_script_name',
        },
        fastcgi_split_path => '^(.+\.php)(/.+)$',
      }
    }
  }

}
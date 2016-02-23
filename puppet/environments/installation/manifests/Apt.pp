class my_apt {

  class { 'apt':
    update => {
      'frequency' => 'always',
    },
  }

  apt::ppa { 'ppa:ondrej/php5-5.6': }
  apt::ppa { 'ppa:nginx/stable': }
  apt::ppa { 'ppa:webupd8team/java': }

}
package{'httpd':
  ensure  => '2.2.22',
}

file{'my_site_conf_dir':
  path    => '/etc/httpd/conf.d/my_site.conf',
  mode    => '0750',
  owner   => 'root',
  group   => 'root',
  content => template('apache/mysite.erb'),
  notify  => Service['httpd'],
  require => Package['httpd']
}

service{'httpd':
  ensure    => running,
  enable    => true,
  hasstatus => true,
  require   => [Package['httpd'],File['my_site_conf_dir']]
}

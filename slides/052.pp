
file{'my_site_conf_dir':
  path     => '/etc/httpd/conf.d/my_site.conf',
  mode     => '0750',
  owner     => 'root',
  group    => 'root',
  content => template('apache/mysite.erb'),
}


service{'httpd':
  ensure    => running,
  enable    => true,
  hasstatus => true,
}

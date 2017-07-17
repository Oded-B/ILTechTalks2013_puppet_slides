#'client' side

  @@file{"${::fqdn}_gdash_templates_dir":
    ensure => directory,
    tag    => 'gdash_templates',
    mode   => '0755',
    path   => "$gdash_templates_dir/hosts/${::fqdn}",
  }
  
#'server' side

  File <<| tag == 'gdash_templates' |>>

define tbl_munin::jmx_munin_plugin($plugin_name = $title) {
  $plugin_conf_file = "${plugin_name}.conf"
  file {$plugin_conf_file:
    path    => "/usr/share/munin/plugins/${plugin_conf_file}",
    source  => "puppet:///modules/something/${plugin_conf_file}",
    require => [Package['munin-node'],File['jmx_']],
    notify  => Service['munin-node'],
  }

  file {"${plugin_name}_link":
    ensure  => link,
    path    => "/etc/munin/plugins/jmx_${plugin_name}",
    target  => '/usr/share/munin/plugins/jmx_',
    require => File['jmx_'],
    notify  => Service['munin-node'],
  }
}
################################################

  tbl_munin::jmx_munin_plugin{[ 'hh_pending', 'java_cpu','java_proc_mem' ]:
    require     => File['munin_jmxquery.jar']
  }

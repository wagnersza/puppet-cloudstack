class cloudstack::centos {
  include clodstack::packages
  include clodstack::mysql
  
  # set SELinux to permissive starting immediately, without requiring a system reboot
  exec { "selinux_change_to_permissive":
    command => "setenforce permissive",
    # onlyif => "test ! -f /var/run/mysqlpass.lock",
  }
  
  service { "ntpd":
    ensure    => running,
    name      => $::services,
    enable    => true,
  }   

  $services = [
    ntpd
    rpcbind
    nfs
  ]
  
    
}

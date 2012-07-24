class cloudstack {
  
  include cloudstack::selinux
    
  service { "add_services":
    ensure    => running,
    name      => $::cloudstack::params::services,
    enable    => true,
  }   
  

}
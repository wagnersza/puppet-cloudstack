case $operatingsystem {
  CentOS : { 
    # set SELinux to permissive starting immediately, without requiring a system reboot
    exec { "selinux_change_to_permissive":
      command => "setenforce permissive",
      onlyif => "/usr/sbin/getenforce | /bin/grep Disabled",
    }      
  }
  default      : { fail "Unsupported operatingsystem ${operatingsystem}" }
}
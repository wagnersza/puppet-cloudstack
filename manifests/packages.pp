class cloudstack::packages {
  
  file { "/etc/yum.repos.d/cloud-temp.repo":
    ensure  => present,
    owner   => root,
    group   => root,
    content => template("cloudstack/repo_cloud_temp.erb"),
  }
  
  file { '/opt/CloudStack-oss-3.0.2-1-rhel6.2.tar.gz':
    ensure  => present,
    mode    => '0550',
    source  => 'puppet:///files/CloudStack-oss-3.0.2-1-rhel6.2.tar.gz',
  }
  
  exec { "selinux_change_to_permissive":
    command => "/bin/tar -zxf /opt/CloudStack-oss-3.0.2-1-rhel6.2.tar.gz -C /opt/; /bin/rm -f /opt/CloudStack-oss-3.0.2-1-rhel6.2.tar.gz",
    onlyif  => "test -f /opt/CloudStack-oss-3.0.2-1-rhel6.2.tar.gz",
  }
    
  package { "ntpd":
    ensure => present,
  }
  
  package { "cloud-client":
    ensure  => present,
    require => File["/etc/yum.repos.d/cloud-temp.repo"]
  } 
  
}
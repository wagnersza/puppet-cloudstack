class cloudstack {
  case $operatingsystem {
    CentOS       : { include cloudstack::centos }
    default      : { fail "Unsupported operatingsystem ${operatingsystem}" }
  }
}
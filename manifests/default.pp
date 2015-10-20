# Vmware Photo default.pp
# Creates a simple server image with java 8 and docker enabled
# phillips.james@gmail.com

package {
  [
    'curl',
    'wget',
    'less',
    'ruby',
    'unzip',
    'maven',
    'openjdk'
  ]:
  ensure => 'installed',
}

exec { "updatedb":
    command => "updatedb",
    path    => "/usr/bin/",
    require => Package["openjdk"],  # an example of requiring a package
    #update the mlocate database so that the locate command works
}

service {
  [ 'docker',
    'puppet'
  ]:
  #specifically, an example of how multiple services can be controlled
  ensure => running,
  enable => true,
}

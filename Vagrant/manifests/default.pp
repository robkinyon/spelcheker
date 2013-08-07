# vim: sw=2

package { "python-software-properties": }
package { "python": }
package { "g++": }
package { "make": }
package { "software-properties-common": }

include apt
apt::ppa { "ppa:chris-lea/node.js":
  alias => "ppa_nodejs",
}

package { "nodejs":
  require => Apt::Ppa["ppa_nodejs"],
  ensure => "latest",
}
exec { "grunt-cli":
  command => "/usr/bin/npm install -g grunt-cli",
  require => Package["nodejs"],
}

# The nodejs plugin didn't work. If it did, we could remove everything above
# this line and replace it with these 5 lines.
#include nodejs
#package { "grunt-cli":
#  ensure => "latest",
#  provider => "npm",
#}

#exec { "npm-install":
#  command => "/usr/bin/npm install",
##  require => Package["grunt-cli"],
#  require => Exec["grunt-cli"],
#}

# This is needed for phantomjs to work. It's a "hidden" dependency in
# that the packaging system(s) don't alert when it's not there. This is not
# clearly documented anywhere outside of the following PhantomJS ticket:
# http://code.google.com/p/phantomjs/issues/detail?id=904
#package { "fontconfig": }

# The top level settings are used as module
# and system configuration.

# A set of users which may be applied and/or used by various modules
# when a 'default' entry is found it will reference the 'default_user'
# from the distro configuration specified below
users:
   - default

# If this is set, 'root' will not be able to ssh in and they 
# will get a message to login instead as the above $user (ubuntu)
disable_root: true

# This will cause the set+update hostname module to not operate (if true)
preserve_hostname: false

# Default: true
# Aliases: apt_update
package_update: true

# Upgrade the instance on first boot
# (ie run apt-get upgrade)
#
# Default: false
# Aliases: apt_upgrade
package_upgrade: true

# Reboot after package install/update if necessary
# Default: false
# Aliases: apt_reboot_if_required
package_reboot_if_required: true

# The modules that run in the 'init' stage
cloud_init_modules:
 - migrator
 - seed_random
 - bootcmd
 - write-files
 - growpart
 - resizefs
 - set_hostname
 - update_hostname
 - update_etc_hosts
 - ca-certs
 - rsyslog
 - users-groups
 - ssh

# The modules that run in the 'config' stage
cloud_config_modules:
# Emit the cloud config ready event
# this can be used by upstart jobs for 'start on cloud-config'.
 - emit_upstart
 - disk_setup
 - mounts
 - ssh-import-id
 - locale
 - set-passwords
 - grub-dpkg
 - apt-pipelining
 - apt-configure
 - package-update-upgrade-install
 - landscape
 - timezone
 - puppet
 - chef
 - salt-minion
 - mcollective
 - disable-ec2-metadata
 - runcmd
 - byobu

# The modules that run in the 'final' stage
cloud_final_modules:
 - rightscale_userdata
 - scripts-vendor
 - scripts-per-once
 - scripts-per-boot
 - scripts-per-instance
 - scripts-user
 - ssh-authkey-fingerprints
 - keys-to-console
 - phone-home
 - final-message
 - power-state-change

apt_sources:
 - source: "ppa:brightbox/ruby-ng"
 - source: "ppa:rwky/redis"
 - source: "ppa:webupd8team/java"

packages:
 - python-software-properties
 - python-pip
 - python-setuptools
 - screen
 - vim
 - build-essential
 - curl
 - iotop
 - atop
 - ruby1.9.1
 - rake
 - openssh-server
 - git
 - software-properties-common
 - open-vm-dkms
 - open-vm-tools
 - open-vm-tools-dkms

# System and/or distro specific settings
# (not accessible to handlers/transforms)
system_info:
   # This will affect which distro class gets used
   distro: ubuntu
   # Default user name + that default users groups (if added/used)
   default_user:
     name: tacicloud
     lock_passwd: True
     gecos: Ubuntu
     groups: [adm, audio, cdrom, dialout, dip, floppy, netdev, plugdev, sudo, video]
     sudo: ["ALL=(ALL) NOPASSWD:ALL"]
     shell: /bin/bash
     gecos: TACI Default Cloud User
     ssh-authorized-keys:
      - ssh-dss AAAAB3NzaC1kc3MAAACBAIIT058AmkJ0ddK/gaNC5ZCMv5glAzazvmYGwqB5onwBjTeIO+AqbG5PI/KJMQgD2DR46QuIHvMZyqkEWTOE8KyYhttqvF+MVEYWiQyX39KUcHrppIDBse0ZL9aX2PqHeOC1w+F6VxAg4KzWLgioZwCxuCDzfxZ/fcWmPtdn5hZPAAAAFQDAVSQJRd2A2IhcG8mNLqW68LhPfQAAAIA5nzKAd+d8T2hh0eX6YgN4mIJePZnKNISJoWxD1gCsrtYIgZVr48nBgmOPP3sI2xgdr7HyGNHO/HCuQ/LbvBOdway7BZwLfLW/tUfLrY6Ufn6bnPEDNeW3jyUS/QLDFFmRyNBQIkvKZbNX3Oc94rXqfdAoWHxZS61c+nfTJoHcOAAAAIAIG83m4UNX0H7ot5ZfIbPJxtA1RK14TOBTFpOBYxW0ebvoLhC6D/CyTXnU0Y4HDZiML8XmPq6XAAmpMfnJhnDE8N26ODjSajySzx2Fxrg10TEhky+7Fwvejq6G5IOxPgfwwofMIZ7pmibyYruE7zXgJqUoirs6HxdMpbz9SKediw== conrad@dev03.timconrad.net
   # Other config here will be given to the distro class and/or path classes
   paths:
      cloud_dir: /var/lib/cloud/
      templates_dir: /etc/cloud/templates/
      upstart_dir: /etc/init/
   package_mirrors:
     - arches: [i386, amd64]
       failsafe:
         primary: http://archive.ubuntu.com/ubuntu
         security: http://security.ubuntu.com/ubuntu
       search:
         primary:
           - http://%(ec2_region)s.ec2.archive.ubuntu.com/ubuntu/
           - http://%(availability_zone)s.clouds.archive.ubuntu.com/ubuntu/
         security: []
     - arches: [armhf, armel, default]
       failsafe:
         primary: http://ports.ubuntu.com/ubuntu-ports
         security: http://ports.ubuntu.com/ubuntu-ports
   ssh_svcname: ssh

#!/bin/sh

yum -y install epel-release
yum -y install ansible --enablerepo=epel-testing

ssh-keygen -t rsa -b 4096 -C kenta.kosugi@netapp.com -N "" -f ~/.ssh/id_rsa << EOF
yes
EOF


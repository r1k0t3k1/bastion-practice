#!/bin/bash
/usr/sbin/sshd
service apache2 start
tail -f /var/log/apache2/access.log

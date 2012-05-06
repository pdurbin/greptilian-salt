# http://salt.readthedocs.org/en/latest/ref/states/highstate.html#names-declaration
server1-packages:
  pkg:
    - installed
    - names:
      - git
      - screen
      - vim-enhanced
      - mutt
      - createrepo
      - rpmdevtools
      - gitweb
      - epel-release
      - salt-master
      - salt-minion
      - perl-libwww-perl
      - perl-JSON
      - ikiwiki
      - perl-YAML-LibYAML
      - gcc
      - yum-utils

denyhosts:
  pkg:
    - installed
  service:
    - enabled

httpd:
  pkg:
    - installed
  service:
    - enabled
    - require:
      - pkg: httpd

mysql-server:
  pkg:
    - installed

mysqld:
  service:
    - enabled

php-packages:
  pkg:
    - installed
    - names:
      - php
      - php-mysql
      - php-pdo
      - php-gd

# http://docs.puppetlabs.com/references/2.7.0/type.html#selboolean
# http://narrabilis.com/node/49
# [root@server1 ~]# getsebool httpd_can_sendmail
# httpd_can_sendmail --> off
# [root@server1 ~]# setsebool -P httpd_can_sendmail=on
# [root@server1 ~]# getsebool httpd_can_sendmail
# httpd_can_sendmail --> on
# [root@server1 ~]# 

iptables:
  service:
    - running
    - watch:
      - file: /etc/sysconfig/iptables

/var/www/thinkup/data:
  file:
    - directory
    - user: apache
    - recurse:
      - user

/var/www/thinkup/config.inc.php:
  file:
    - managed
    - user: apache

/etc/sysconfig/iptables:
  file:
    - managed
    - source: salt://server1/etc/sysconfig/iptables
    - mode: 600
    - user: root
    - group: root

/etc/gitweb.conf:
  file:
    - managed
    - source: salt://server1/etc/gitweb.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/git.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/git.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/wiki.greptilian.com.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/wiki.greptilian.com.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/data.greptilian.com.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/data.greptilian.com.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/munin.greptilian.com.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/munin.greptilian.com.conf
    - mode: 444
    - user: root
    - group: root

/etc/munin/munin.conf:
  file:
    - managed
    - source: salt://server1/etc/munin/munin.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/thinkup.greptilian.com.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/thinkup.greptilian.com.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/git.greptilian.com.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/git.greptilian.com.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/welcome.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/welcome.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/yum.greptilian.com.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/yum.greptilian.com.conf
    - mode: 444
    - user: root
    - group: root

/etc/httpd/conf.d/0greptilian.conf:
  file:
    - managed
    - source: salt://server1/etc/httpd/conf.d/0greptilian.conf
    - mode: 444
    - user: root
    - group: root

/etc/yum.repos.d/greptilian.repo:
  file:
    - managed
    - source: salt://server1/etc/yum.repos.d/greptilian.repo
    - mode: 444
    - user: root
    - group: root

/usr/sbin/server1-puppet-apply.sh:
  file:
    - managed
    - source: salt://server1/usr/sbin/server1-puppet-apply.sh
    - mode: 555
    - user: root
    - group: root

/usr/sbin/server1-salt.sh:
  file:
    - managed
    - source: salt://server1/usr/sbin/server1-salt.sh
    - mode: 444
    - user: root
    - group: root

/var/lib/git:
  file:
    - directory
    - user: pdurbin
    - group: root
    - mode: 755

/var/www/wiki:
  file:
    - directory
    - user: pdurbin
    - group: root
    - mode: 755

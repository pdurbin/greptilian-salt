# http://salt.readthedocs.org/en/latest/ref/states/highstate.html#names-declaration
server1-packages:
  pkg:
    - installed
    - names:
      - git
      - screen
      - rubygems
      - vim-enhanced
      - gitweb
      - epel-release
      - salt-master
      - salt-minion

rpm-packages:
  pkg:
    - installed
    - names:
      - createrepo
      - rpmdevtools

httpd:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: httpd
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

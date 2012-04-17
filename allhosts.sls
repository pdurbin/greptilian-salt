allhosts-packages:
  pkg:
    - installed
     # http://salt.readthedocs.org/en/latest/ref/states/highstate.html#names-declaration
    - names:
      - vim-enhanced

/usr/local/sbin/saltshow:
  file:
    - managed
    - source: salt://files/saltshow
    - user: root
    - group: root
    - mode: 755

/usr/local/sbin/saltexec:
  file:
    - managed
    - source: salt://files/saltexec
    - user: root
    - group: root
    - mode: 755

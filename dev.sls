dev-packages:
  pkg:
    - installed
    - names:
      - git
      - screen
      - strace
      - ack
      - elinks
      - perl-Crypt-SSLeay

/usr/local/bin/gits:
  file:
    - managed
    - source: salt://files/gits
    - user: root
    - group: root
    - mode: 755

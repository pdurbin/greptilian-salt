dev-packages:
  pkg:
    - installed
    - names:
      - git-core

/usr/local/bin/gits:
  file:
    - managed
    - source: salt://files/gits
    - user: root
    - group: root
    - mode: 755

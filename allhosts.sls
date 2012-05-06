allhosts-packages:
  pkg:
    - installed
     # http://salt.readthedocs.org/en/latest/ref/states/highstate.html#names-declaration
    - names:
      - mutt
      - mlocate


# http://salt.readthedocs.org/en/latest/topics/tutorials/states_pt3.html#using-grains-in-sls-modules
vim:
  pkg:
    {% if grains['os'] == 'CentOS' %}
    - name: vim-enhanced
    {% elif grains['os'] == 'Ubuntu' %}
    - name: vim
    {% endif %}
    - installed

/usr/local/sbin/saltlocalshow:
  file:
    - managed
    - source: salt://files/saltlocalshow
    - user: root
    - group: root
    - mode: 755

/usr/local/sbin/saltlocalexec:
  file:
    - managed
    - source: salt://files/saltlocalexec
    - user: root
    - group: root
    - mode: 755

/usr/local/sbin/saltallshow:
  file:
    - managed
    - source: salt://files/saltallshow
    - user: root
    - group: root
    - mode: 755

/usr/local/sbin/saltallexec:
  file:
    - managed
    - source: salt://files/saltallexec
    - user: root
    - group: root
    - mode: 755

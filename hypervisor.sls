hypervisor-packages:
  pkg:
    - installed
    - names:
      - qemu-kvm
      - libvirt

libvirtd:
  service:
    - enabled

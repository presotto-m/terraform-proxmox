resource "proxmox_lxc" "vm-01" {
  hostname = "debian11"
  target_node = "pve01"
  ostemplate = "local:vztmpl/debian-11-standard_11.3-1_amd64.tar.zst"
  password = "password"
  cores = 4
  memory = 2048
  swap = 512

  rootfs {
    storage = "local-lvm"
    size = "10G"
  }

  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "dhcp"
  }
}

resource "proxmox_lxc" "vm-02" {
  hostname = "debian12"
  target_node = "pve02"
  ostemplate = "local:vztmpl/debian-11-standard_11.3-1_amd64.tar.zst"
  password = "password"
  cores = 2
  memory = 1024
  swap = 128

  rootfs {
    storage = "local-lvm"
    size = "15G"
  }

  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "dhcp"
  }
}

resource "proxmox_lxc" "vm-03" {
    hostname = "testedoclone"
    target_node = "pve01"
    password = "password"
    clone = "105"

}

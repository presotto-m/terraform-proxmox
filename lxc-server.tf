resource "proxmox_lxc" "cloud_teste" {
  target_node  = "pve01"
  hostname     = "lxc-cloud-teste"
  ostemplate   = "local:vztmpl/debian-11-standard_11.3-1_amd64.tar.zst"
  password     = "brasilfone"
  unprivileged = true

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}
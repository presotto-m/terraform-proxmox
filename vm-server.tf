resource "proxmox_vm_qemu" "teste-terraform" {
    name = "testando"
    desc = "criando-vm-com-iso"
    vmid = "150"
    target_node = "pve01"

    clone =  "debian-template"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "local-lvm"
        type = "virtio"
        size = "20G"
    }

    os_type = "cloud-init"
    ipconfig0 = ""
    ciuser = "root"
    sshkeys = ""
    
} 

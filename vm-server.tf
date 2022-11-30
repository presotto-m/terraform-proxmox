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
    ipconfig0 = "ip=192.168.170.30/24,gw=192.168.170.1"
    ciuser = "root"
    sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAn9XfNr1csiUhVbn/ThHasPRQsyaH35+Y0YZZkdx7Z8cuU9FIiIK5RD6XpEyNvPAcA+SCAB21aJn3yri6LuWy3i9shIstFWqmLjHfdtOfKJu3Z3UxbHdQBWG16RUhAh8r/BFHrzqGUA0PHfhZsSVWxY6tnPQcjp8ICedHOtxNUW/Synd/Ws8MgutuiXibmGkW02EPduVAgFYxP0koqfFMN6qdoxS9nBb2liCH+04f+H1Xh1vVXNgCk33pB4iWfvsAXQ0gVCnYYgOWQyO/aZkdmZuwRcH+ANdbvxYahLVxMC4Zet+E3dtphnL7BMB9oQFYQNQGhtTdQ1GcSowvrcQBlw== key-mp"
    
} 

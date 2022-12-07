#Criação de maquinas com terraform - configurações basicas:


resource "proxmox_vm_qemu" "k8s-ctrlr" {
    name = "k8s-ctrlr"
    vmid = "200"
    target_node = "pve01"

    iso = "local:iso/debian-11.5.0-amd64-netinst.iso"
    os_type = "ubuntu"
    cores = 4
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
    
}  
    
resource "proxmox_vm_qemu" "k8s-node" {
    name = "k8s-node"
    vmid = "210"
    target_node = "pve01"

    iso = "local:iso/debian-11.5.0-amd64-netinst.iso"
    os_type = "ubuntu"
    cores = 4
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

    
} 


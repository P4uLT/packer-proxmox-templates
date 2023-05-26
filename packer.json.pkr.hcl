variable "proxmox_url" {
  type    = string
  default = "https://xxxx:8006/api2/json"
}

variable "insecure_skip_tls_verify" {
  type    = bool
  default = true
}

variable "proxmox_username" {
  type    = string
  default = "root@pam"
}

variable "proxmox_password" {
  type      = string
  default   = "xxx"
  sensitive = true
}

variable "node" {
  type    = string
  default = "kheb-gen8"
}

variable "memory" {
  type    = string
  default = "1024"
}

variable "cores" {
  type    = string
  default = "4"
}

variable "unprivileged" {
  type    = bool
  default = false
}


variable "template_file" {
  type    = string
  default = "debian-11-standard_11.6-1_amd64.tar.zst"
}
variable "template_suffix" {
  type    = string
  default = "custom"
}

variable "template_storage_pool" {
  type    = string
  default = "NAS"
}


variable "backup_storage_pool" {
  type    = string
  default = "NAS"
}

variable "filesystem_storage" {
  type    = string
  default = "local-lvm"
}

variable "filesystem_size" {
  type    = string
  default = "32"
}

variable "vmid" {
  type    = number
  default = 999
}

variable "provision_ip" {
  type    = string
  default = "10.116.146.254"
}

variable "provision_gateway_ip" {
  type    = string
  default = "10.116.146.1"
}

variable "provision_mac" {
  type    = string
  default = "B6:1A:E1:C5:86:03"
}

variable "ssh_username" {
  type    = string
  default = "root"
}


source "proxmox-lxc-vztmpl" "debian" {
  proxmox_url                = "${var.proxmox_url}"
  insecure_skip_tls_verify   = "${var.insecure_skip_tls_verify}"
  username                   = "${var.proxmox_username}"
  password                   = "${var.proxmox_password}"
  node                       = "${var.node}"
  memory                     = "${var.memory}"
  cores                      = "${var.cores}"
  unprivileged               = "${var.unprivileged}"
  template_file              = "${var.template_file}"
  template_storage_pool      = "${var.template_storage_pool}"
  template_suffix            = "${var.template_suffix}"
  backup_storage_pool        = "${var.backup_storage_pool}"
  filesystem_storage         = "${var.filesystem_storage}"
  filesystem_size            = "${var.filesystem_size}"
  provision_ip               = "${var.provision_ip}"
  provision_gateway_ip       = "${var.provision_gateway_ip}"
  provision_mac              = "${var.provision_mac}"
  ssh_username               = "${var.ssh_username}"
  vmid                       = "${var.vmid}"

}

build {
  description = "Build LXC template"

  sources = ["source.proxmox-lxc-vztmpl.debian"]
  provisioner "shell" {
    script = "scripts/base.sh"
  }
}
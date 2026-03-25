terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "hcloud" {}

resource "hcloud_server" "devops_vm" {
  name        = "devops-terraform-test"
  image       = "ubuntu-24.04"
  server_type = "cx23"
  location    = "nbg1"
  ssh_keys    = ["andrzej-vps"]
}

resource "hcloud_server" "monitoring_vm" {
  name        = "devops-monitoring-test"
  image       = "ubuntu-24.04"
  server_type = "cx23"
  location    = "nbg1"
  ssh_keys    = ["andrzej-vps"]
}

resource "local_file" "ansible_inventory" {
  filename = "/home/andrew/projekty/ansible-hetzner-test/inventory"

  content = <<EOT
[app]
${hcloud_server.devops_vm.ipv4_address} ansible_user=root

[monitoring]
${hcloud_server.monitoring_vm.ipv4_address} ansible_user=root
EOT
}

terraform {
  cloud {
    organization = "andrzejpusty"

    workspaces {
      name = "terraform-hetzner"
    }
  }

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
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


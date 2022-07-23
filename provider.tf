terraform {
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}
variable "do_token" {}

variable "pvt_key" {}
provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "terraform"
}

resource "digitalocean_droplet" "chefbot" {
    image   = "ubuntu-18-04-x64"
    name    = "chef-bot"
    region  = "nyc2"
    size    = "s-1vcpu-1gb"
    ssh_keys = [ var.ssh_key ]
    connection {
      host = self.ipv4_address
      user = "root"
      type = "ssh"
      private_key = file(var.pvt_key)
      timeout = "2m"
    }
    provisioner "remote-exec" {
      inline = [
        "export PATH=$PATH:/usr/bin",
        "sudo apt update"
      ]
    }

}
terraform {
    required_providers {
        digitalocean = {
            source = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}
variable "do_token" {}

variable "sshkey" {
  description = "Public ssh key"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCd8n54gAezdCHSwUWTMkNBut3WwT64Xtp+fQkfQ4IAMWoDBV8ScPXsO+DpkholMwNx6Xh9Aq07Y6jBr8n/bv8dak59GXht2IQW9qn5Ft6+3ie5/esMabdTX4/nzs2C5VMkOXL4wv6rSDXkYsjFzfhV0G9CN3YEf0DCvXHPADdhpQXIvUh9u3VfUT/I5xpaHHsSgvYoKyR5Q6iBFaMvbVmmvNkouvo+rGTph/HIEFOEC/Sra0dONMt6F+I2pViIkQ6+QDgQX6WpOUjgnWbLh+Rh2eY9Hb6fX85K+/EsqfWBvTpQg2W+w2iXM5M33gnGNR2gQifgurlvA+MPdfTES5NLthtNstAuPKHcnSxIZKRGAOKAQl5DWrU1P+JxATFCIqDpnzTnuPpONbBOEkzVQWSjKp2uvox9IrUQ/B8sgh1fhx3yBG4bAePqAoKrERL4qvMbs6TEhzvMQB47Pj9gMEcUb4HiPMtu3N8cSGK4TAiCKphroSmvBBezTMarsg5DMv0= daniel@windows10-client-0"
}
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
}
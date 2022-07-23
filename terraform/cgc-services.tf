resource "digitalocean_droplet" "cgc-services" {
  image   = "ubuntu-18-04-x64"
  name    = "cgc-services"
  region  = "nyc1"
  size    = "s-1vcpu-1gb"
  ssh_keys = [ data.digitalocean_ssh_key.win-10.id ]
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
      "apt-get update && apt-get upgrade -y",
      "apt-get install git ufw -y",
      "git clone https://github.com/DanEager19/cgc-service-devops",
      "cd cgc-service-devops",
      "./docker.sh",
      "git clone https://github.com/DanEager19/kitchenware-request-api",
      "git clone https://github.com/DanEager19/chef-bot",
      "echo ${var.discord_api_token} > ./chef-bot/.env",
      "echo ${var.guild_id} > ./chef-bot/.env",
      "echo ${var.client_id} > ./chef-bot/.env",
      "echo ${var.sendgrid_api_key} > ./kitchenware-requst-api/.env"
    ]
  }
}
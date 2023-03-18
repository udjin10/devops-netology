terraform {
  required_providers {
    virtualbox = {
      source = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
}

provider "virtualbox" {
  delay      = 60
  mintimeout = 5
}

resource "virtualbox_vm" "tmp_node" {
  name   = "tmp-node"
  image  = "/home/mask/deb-11"
  cpus      = 2
  memory    = "2 GiB"


  network_adapter {
    type           = "bridged"
    device         = "IntelPro1000MTDesktop"
    host_interface = "wlo1"
    # On Windows use this instead
    # host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}

output "ipv4_address" {
 value = element(virtualbox_vm.tmp_node.*.network_adapter.0.ipv4_address, 1)
}
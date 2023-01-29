
resource "yandex_compute_instance" "vm01" {
  name                      = "vm01"
  zone                      = "ru-central1-b"
  hostname                  = "vm01.mkv.cloud"
  allow_stopping_for_update = true
  resources {
    cores  = 8
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = var.centos-7-base
      name     = "root-vm01"
      type     = "network-hdd"
      size     = "50"
    }
  }
  network_interface {
    subnet_id = var.subnet
    nat       = true
  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_ed25519.pub")}"
  }
}
resource "yandex_compute_instance" "vm02" {
  name                      = "vm02"
  zone                      = "ru-central1-b"
  hostname                  = "vm02.mkv.cloud"
  allow_stopping_for_update = true
  resources {
    cores  = 8
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = var.centos-7-base
      name     = "root-vm02"
      type     = "network-hdd"
      size     = "50"
    }
  }
  network_interface {
    subnet_id = var.subnet
    nat       = true
  }
  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_ed25519.pub")}"
  }
}
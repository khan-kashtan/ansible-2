variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable machine_type {
  description = "Default machine type"
}

variable zone {
  description = "Default zone"
}

variable user_ssh {
  description = "Username for ssh private and public keys"
}

variable xenial_image {
  description = "Clean Xenial image"
  default     = "ubuntu-1604-lts"
}

variable focal_image {
  description = "Clean Focal image"
  default     = "ubuntu-2004-lts"
}

provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source          = "../modules/app"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  machine_type    = "${var.machine_type}"
  user_ssh        = "${var.user_ssh}"
  xenial_image    = "${var.xenial_image}"
}

module "db" {
  source          = "../modules/db"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  focal_image     = "${var.focal_image}"
  machine_type    = "${var.machine_type}"
  user_ssh        = "${var.user_ssh}"
}

module "vpc" {
  source = "../modules/vpc"
}

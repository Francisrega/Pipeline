#Define variables
variable "compartment_ocid" {}
variable "vcn_ocid" {}
variable "subnet_ocid" {}
variable "instance_display_name" {}
variable "instance_shape" {}
variable "instance_image_id" {}
variable "instance_ssh_public_key" {}
variable "instance_count" {}
variable "git_repo_url" {}
variable "git_repo_branch" {}
variable "app_name" {}
variable "fn_app_name" {}
variable "fn_function_name" {}
variable "fn_application_id" {}
variable "fn_invoke_function_endpoint" {}
variable "namespace" {}
variable "bucket" {}
variable "region" {}

#Define resources
resource "oci_core_instance" "devops_instance"{
    availability_domain = "${var.availability_domain}"
    compartment_id      = "${var.compartment_ocid}"
    display_name        = "${var.instance_display_name}"
    shape               = "${var.instance_shape}"
    image_id            = "${var.instance_image_id}"
    subnet_id           = "${var.subnet_ocid}"
    metadata            = {
        ssh_authorized_keys = "${var.instance_ssh_public_key}"
  }
  count               = "${var.instance_count}"
}

resource "oci_devops_pipeline" "devops_pipeline" {
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.app_name}"
  defined_tags = {
    "owner" = "devops_team"
  }


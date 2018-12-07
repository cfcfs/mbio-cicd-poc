// ===========================================================================
// Scaleway account settings (access and token), see:
// https://cloud.scaleway.com/#/credentials
//
// The organization id can be found here
// https://cloud.scaleway.com/#/account
// ===========================================================================

variable "scaleway_organization" {
  type        = "string"
  default     = ""
  description = "Scaleway organization uid"
}

variable "scaleway_access" {
  type        = "string"
  default     = ""
  description = "Scaleway access uid"
}

variable "scaleway_token" {
  type        = "string"
  default     = ""
  description = "Scaleway access token"
}


variable "private_key" {
  type        = "string"
  default     = ""
  description = "The path to the private key, example: ~/.ssh/optimusprime_id_rsa"
}

// ===========================================================================
// Kubernetes
// ===========================================================================


variable "docker_version" {
  default     = "18.03.0~ce-0~ubuntu"
  description = "Use 18.03.0~ce-0~ubuntu"
}

variable "k8s_version" {
  default = "stable-1.11"
}

variable "weave_passwd" {
  default = "weave-password-change-me"
}

variable "arch" {
  default     = "x86_64"
  description = "Values: arm arm64 x86_64"
}

variable "region" {
  default     = "ams1"
  description = "Values: par1 ams1"
}

variable "server_type" {
  default     = "START1-S"
  description = "1 X86 64bit Cores 1GB memory 100Mbit/s Unmetered"
}

variable "server_type_node" {
  default     = "C2S"
  description = "1 X86 64bit Cores 1GB memory 100Mbit/s Unmetered"
  # default     = "START1-S"
  # description = "2 X86 64bit Cores 2GB memory 200Mbit/s Unmetered"
}

variable "nodes" {
  default = 2
}

variable "masters" {
  default = 1
}

variable "ip_admin" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = "IP access to services"
}

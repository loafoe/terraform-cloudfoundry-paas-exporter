variable "cf_org_name" {
  description = "Cloudfoundry ORG name to use for reverse proxy"
  type        = string
}

variable "cf_space_id" {
  description = "Cloudfoundry SPACE id to use for deploying all Thanos components."
  type        = string
}

variable "name_postfix" {
  type        = string
  description = "The postfix string to append to the space, hostname, etc. Prevents namespace clashes"
  default     = ""
}

variable "environment" {
  type        = map(any)
  description = "Pass environment variable to the app"
  default     = {}
}

variable "docker_username" {
  type        = string
  description = "Docker registry username"
  default     = ""
}

variable "docker_password" {
  type        = string
  description = "Docker registry password"
  default     = ""
}

variable "cf_functional_account" {
  type = object({
    api_endpoint = string
    username     = string
    password     = string
  })
  description = "Configuration for the CloudFoundry function account. Required for variant and if enable_cf_exporter is set to true"
  default = {
    api_endpoint = ""
    username     = ""
    password     = ""
  }
}

variable "cf_paas_exporter_image" {
  description = "Image to use for cf paas exporter. Use a v* tagged version to prevent automatic updates"
  default     = "governmentpaas/paas-prometheus-exporter:latest"
  type        = string
}

variable "region" {
  type    = string
  default = "eu-west"
}

variable "cf_paas_exporter_memory" {
  type        = number
  description = "CF PaaS Exporter memory"
  default     = 256
}

variable "cf_paas_exporter_disk_quota" {
  type        = number
  description = "CF PaaS Exporter disk quota"
  default     = 100
}

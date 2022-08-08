l;oc

resource "random_pet" "deploy" {
}

resource "cloudfoundry_app" "exporter" {
  name         = "tf-pass-exporter-${local.postfix}"
  space        = var.cf_space_id
  memory       = var.cf_paas_exporter_memory
  disk_quota   = var.cf_paas_exporter_disk_quota
  docker_image = var.cf_paas_exporter_image
  docker_credentials = {
    username = var.docker_username
    password = var.docker_password
  }
  environment = {
    USERNAME     = var.cf_functional_account.username
    PASSWORD     = var.cf_functional_account.password
    API_ENDPOINT = var.cf_functional_account.api_endpoint
  }

  routes {
    route = cloudfoundry_route.cfpaasexporter_internal.id
  }

  labels = {
    "variant.tva/exporter" = true
  }

  annotations = {
    "prometheus.exporter.port" = "8080"
    "prometheus.exporter.path" = "/metrics"
  }
}

resource "cloudfoundry_route" "cfpaasexporter_internal" {
  domain   = data.cloudfoundry_domain.apps_internal_domain.id
  space    = var.cf_space_id
  hostname = "tf-exporter-${local.postfix}"
}

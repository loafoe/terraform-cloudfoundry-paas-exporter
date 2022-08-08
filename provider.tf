provider "hsdp" {
  region = var.region
}

provider "cloudfoundry" {
  //noinspection HILUnresolvedReference
  api_url  = data.hsdp_config.cf.url
  user     = var.cf_functional_account.username
  password = var.cf_functional_account.password
}

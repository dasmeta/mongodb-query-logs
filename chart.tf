module "release" {
  source  = "terraform-module/release/helm"
  version = "2.6.0"

  namespace  = "default"
  repository =  "https://charts.helm.sh/stable"

  app = {
    name          = "mongodb-query-logs"
    version       = "0.0.2"
    chart         = "${path.module}/helm/mongodb-query-logs"
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }

  values = []

  set = [
    {
      name  = "config.MONGO_HOST"
      value = "${var.mongodb-host}"
    },
    {
      name  = "config.MONGO_PORT"
      value = "${var.mongodb-port}"
    },
    {
      name  = "config.MONGO_DB"
      value = "${var.mongodb-database}"
    },
    {
      name  = "config.LOG_INTERVAL"
      value = "${var.log-interval}"
    },
    {
      name  = "config.LIMIT"
      value = "${var.limit}"
      type  = "string"
    }
  ]

  set_sensitive = [
    {
      path  = "config.MONGO_USER"
      value = "${var.mongodb-username}"
    },
    {
      path  = "config.MONGO_PASS"
      value = "${var.mongodb-password}"
    },
  ]
}

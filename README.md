```hcl
module mongodb-query-logs {
  source = ""

  mongodb-host      = "localhost"
  mongodb-port      = "27017"
  mongodb-database  = "admin"
  mongodb-username  = "root"
  mongodb-password  = "root"
  log-interval      = "30"
  limit             = "-1"

}

```
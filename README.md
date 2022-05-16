# Mongodb Slow Query Monitoring

Pulling and logging slow queries from mongodb.

Container will regularely query mongodb for slow queries using `db.currentOp()` and dump info into log.

Those logs then can be captured and monitored using whatever monitoring tool you use.

```hcl
module mongodb-query-logs {
  source  = "dasmeta/mongodb-query-logs/any"
  version = "0.1.1" #update version

  mongodb-host      = "localhost"
  mongodb-port      = "27017"
  mongodb-database  = "admin"
  mongodb-username  = "root"
  mongodb-password  = "root"
  log-interval      = "30"
  limit             = "-1"
}

```

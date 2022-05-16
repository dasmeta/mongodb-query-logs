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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.5.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_release"></a> [release](#module\_release) | terraform-module/release/helm | 2.6.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_limit"></a> [limit](#input\_limit) | n/a | `string` | `"json"` | no |
| <a name="input_log-interval"></a> [log-interval](#input\_log-interval) | aws-default-region. | `string` | `"30"` | no |
| <a name="input_mongodb-database"></a> [mongodb-database](#input\_mongodb-database) | Mongodb database. | `string` | `""` | no |
| <a name="input_mongodb-host"></a> [mongodb-host](#input\_mongodb-host) | Mongodb host. | `string` | `"localhost"` | no |
| <a name="input_mongodb-password"></a> [mongodb-password](#input\_mongodb-password) | Mongodb password. | `string` | n/a | yes |
| <a name="input_mongodb-port"></a> [mongodb-port](#input\_mongodb-port) | Mongodb port. | `string` | `"27017"` | no |
| <a name="input_mongodb-username"></a> [mongodb-username](#input\_mongodb-username) | Mongodb user. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
variable mongodb-host {
  type        = string
  default = "localhost"
  description = "Mongodb host."
}

variable mongodb-database {
  type        = string
  default     = ""
  description = "Mongodb database."
}

variable mongodb-username {
  type        = string
  description = "Mongodb user."
  sensitive = true
}

variable mongodb-password {
  type        = string
  description = "Mongodb password."
  sensitive = true
}

variable mongodb-port {
  type        = string
  default     = "27017"
  description = "Mongodb port."
}

variable limit {
  type        = string
  default     = "json"
  description = ""
  
}
variable log-interval {
  type        = string
  default     = "30"
  description = "aws-default-region."
}

The ```variable``` argurment contain the following properties

```
description
default
type
validation
sensitive

```

```
variable "number_example" {
    description="An example of numbers"
    type = number
    default = 42
}
```

```terraform plan -var "server_port=8080"```

```
### Another of inputing variables
export TF_VAR_server_port=8080
terraform plan
```

### Output
```
output "Name" {
    value = <value>
    [config...]
}

description
sensitive
depends_on
```

### Deploying a Cluster of Web Servers
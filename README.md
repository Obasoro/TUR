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
```A single server create rom fo failure```

```
Application Load Balancer (ALB)
Best suited for load balancing of HTTP and HTTPS traffic. Operates at the
application layer (Layer 7) of the OSI model.
```

```
Network Load Balancer (NLB)
Best suited for load balancing of TCP, UDP, and TLS traffic. Can scale up and
down in response to load faster than the ALB (the NLB is designed to scale to
tens of millions of requests per second). Operates at the transport layer (Layer
4) of the OSI model.
```

### Understanding how Terraform Manages State and Files 3

- What is terraform state
- shared storage afor stae files
- limitation with Terraform backend
- Isolating stae files

```
Limitations with Terraform’s Backends
when experiencing this error, delete the state, lock file on the local system and reinitialize

Error: Backend initialization required, please run "terraform init"
│ 
│ Reason: Unsetting the previously set backend "s3"
│ 
│ The "backend" is the interface that Terraform uses to store state,
│ perform operations, etc. If this message is showing up, it means that the
│ Terraform configuration you're using is using a custom configuration for
│ the Terraform backend.
│ 
│ Changes to backend configurations require reinitialization. This allows
│ Terraform to set up the new configuration, copy existing state, etc. Please run
│ "terraform init" with either the "-reconfigure" or "-migrate-state" flags to
│ use the current configuration.
│ 
│ If the change reason above is incorrect, please verify your configuration
│ hasn't changed and try again. At this point, no changes to your existing
│ configuration or state have been made.
╵

```
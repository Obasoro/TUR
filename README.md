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
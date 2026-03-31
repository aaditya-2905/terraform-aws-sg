# Terraform AWS Security Group Module

This module provisions an AWS Security Group with customizable ingress and egress rules. It is designed to be flexible and reusable, and can be integrated with VPC and EC2 modules.

---

## 🚀 Features

* Create Security Group within a VPC
* Configure multiple ingress and egress rules dynamically
* Fully configurable ports — no hardcoding
* Supports tagging for better resource management

---

## 📦 Usage

```hcl
provider "aws" {
  region = "ap-south-1"
}

module "sg" {
  source = "aaditya-2905/sg/aws"

  vpc_id      = "vpc-xxxxxxxx"
  environment = "dev"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/8"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  # egress_rules defaults to allow-all (0.0.0.0/0) if not specified
}
```

---

## 📥 Inputs

| Name            | Description                              | Type         | Required | Default      |
| --------------- | ---------------------------------------- | ------------ | -------- | ------------ |
| `vpc_id`        | VPC ID where the SG will be created      | `string`     | ✅        | —            |
| `environment`   | Environment name (e.g. dev, prod)        | `string`     | ✅        | —            |
| `ingress_rules` | List of ingress rules (ports/protocols)  | `list(object)` | ✅      | `[]`         |
| `egress_rules`  | List of egress rules (ports/protocols)   | `list(object)` | ❌      | allow-all    |

Each rule object has:
```hcl
{
  from_port   = number
  to_port     = number
  protocol    = string        # "tcp", "udp", or "-1" for all
  cidr_blocks = list(string)
}
```

---

## 📤 Outputs

| Name    | Description                  |
| ------- | ---------------------------- |
| `sg_id` | ID of the created Security Group |

---

## 🧠 Notes

* Ensure the VPC ID is valid and exists in the target region
* `ingress_rules` defaults to `[]` — **no inbound access** unless you specify rules
* Avoid opening all ports (`0.0.0.0/0`) in production unless necessary
* Follow least privilege principle for security rules

---

## 🔗 Example

See the [`examples/basics`](./examples/basics) directory for a working example.

---

# Terraform AWS Security Group Module

This module provisions an AWS Security Group with customizable ingress and egress rules. It is designed to be flexible and reusable, and can be integrated with VPC and EC2 modules.

---

## 🚀 Features

* Create Security Group within a VPC
* Configure multiple ingress rules dynamically
* Configure multiple egress rules dynamically
* Fully customizable and reusable
* Supports tagging for better resource management

---

## 📦 Usage

```hcl
provider "aws" {
  region = "ap-south-1"
}

module "sg" {
  source = "aaditya-2905/sg/aws"

  vpc_id = "vpc-xxxxxxxx"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Environment = "dev"
  }
}
```

---

## 📥 Inputs

| Name          | Description                     | Type         | Required |
| ------------- | ------------------------------- | ------------ | -------- |
| vpc_id        | VPC ID where SG will be created | string       | ✅        |
| ingress_rules | List of ingress rules           | list(object) | ✅        |
| egress_rules  | List of egress rules            | list(object) | ✅        |
| tags          | Tags to apply                   | map(string)  | ❌        |

---

## 📤 Outputs

| Name  | Description       |
| ----- | ----------------- |
| sg_id | Security Group ID |

---

## 🧠 Notes

* Ensure the VPC ID is valid and exists
* Avoid opening all ports (0.0.0.0/0) in production unless necessary
* Follow least privilege principle for security rules

---

## 🔗 Example

See the `examples/basic` directory for working examples.

---

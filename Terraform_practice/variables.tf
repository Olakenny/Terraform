variable "region" {
  description = "The aws region"
  type        = string
  default     = "us-west-1"
}

/*variable "ami-id" {
  description = "The aws ami id"
  type        = string
  default     = "ami-09208e69ff3feb1db"
}
*/


variable "instance_type_string" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_type_list" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}

variable "instance_type_map" {
  type = map(string)
  default = {
    "dev"  = "t2.micro"
    "qa"   = "t2.small"
    "prod" = "t2.medium"
  }
}

variable "key_pair" {
  type    = string
  default = "tf"
}

variable "ingressrules" {
  type    = list(number)
  default = [80, 443, 8080, 22]
}

variable "egressrules" {
  type    = list(number)
  default = [80, 443, 8080, 25, 3306, 53]
}


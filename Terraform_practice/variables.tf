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


variable "type_of_instance" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair" {
  type    = string
  default = "tf"
}
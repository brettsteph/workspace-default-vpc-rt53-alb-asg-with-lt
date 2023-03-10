variable "region" {
  type        = string
  description = "VPC region"
  default     = "us-east-1"
}
# variable "vpc-id" {
#   type        = string
#   description = "VPC id"
#   default     = "vpc-092910cd6be87fee9"
# }
# variable "public-subnets" {
#   type        = list
#   description = "Default VPC Public subnets - us-east-1a, us-east-1b"
#   default     = ["subnet-05b5a0bf482cdcf33", "subnet-0bda27ca4d6ed508f"]
# }
# variable "availability-zones" {
#   type        = list
#   description = "Availability zone"
#   default     = ["us-east-1a", "us-east-1b"]
# }
variable "tags" {
  type        = map(any)
  description = "Tags"
  default = {
    Name        = "Web Server"
    Environment = "dev"
  }
}
variable "access-key" {
  type        = string
  description = "Access Key Pair"
  default     = "ssh-cloudops-key"
}
# variable "instance-name" {
#   type        = string
#   description = "Instance name"
#   default     = "Static Site Web Server"
# }
# variable "instance-ami" {
#   type        = string
#   description = "Linux 2 AMI"
#   default     = "ami-0c02fb55956c7d316"
# }
variable "instance-type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}
variable "my-ip-cidr-block" {
  type        = string
  description = "My IP address CIDR"
  default     = "162.192.198.83/32"
}
variable "ebs-type" {
  type        = string
  description = "EBS Volume type"
  default     = "gp2"
}
variable "ebs-size" {
  type        = string
  description = "EBS Volume size, must be >= 8GB"
  default     = 8
}
variable "s3-bucket-name" {
  type        = string
  description = "Name of s3 bucket where static web files are stored"
  default     = "ec2-with-static-site"
}

variable "domain" {
  type        = string
  description = "Hosted zone domain"
  default     = "brettstephen.com"
}
variable "sub-domain" {
  type        = string
  description = "site sub domain"
  default     = "aws-ec2.brettstephen.com"
}
variable "AWS_REGION" {
  type        = string
  description = "VPC region"
}
variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
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
variable "private_access_key" {
  type        = string
  description = "Access Key Pair"
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
variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}
variable "my_ip_cidr_block" {
  type        = string
  description = "My IP address CIDR"
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
# variable "s3_bucket_name" {
#   type        = string
#   description = "Name of s3 bucket where static web files are stored"
#   default     = "static-web-site"
# }

# variable "domain" {
#   type        = string
#   description = "Hosted zone domain"
#   default     = "brettstephen.com"
# }
# variable "sub_domain" {
#   type        = string
#   description = "site sub domain"
#   default     = "aws-ec2.brettstephen.com"
# }

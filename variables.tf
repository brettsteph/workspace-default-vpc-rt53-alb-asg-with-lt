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

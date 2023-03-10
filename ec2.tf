data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# resource "aws_instance" "instance" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = var.instance-type
#   availability_zone      = aws_subnet.public_1.id
#   vpc_security_group_ids = [aws_security_group.web-security-group.id]

#   iam_instance_profile = aws_iam_instance_profile.ec2-iam-profile.id

#   key_name = var.access-key

#   root_block_device {
#     delete_on_termination = true
#     encrypted             = true
#     volume_size           = var.ebs-size
#     volume_type           = var.ebs-type
#   }


#   tags = var.tags

#   user_data = <<EOF
# #!/bin/bash
# sudo su
# yum update -y
# yum install -y httpd
# aws s3 cp s3://ec2-with-static-site --region us-east-1 /var/www/html/ --recursive
# systemctl start httpd
# systemctl enable httpd
# EOF
# }

# resource "aws_eip" "eip" {
#   instance = aws_instance.instance.id
#   vpc      = true
# }


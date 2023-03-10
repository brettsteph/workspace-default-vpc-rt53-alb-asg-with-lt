resource "aws_launch_template" "lt" {
  name = "Instance-LT"

  # block_device_mappings {
  #   device_name = "/dev/sda1"

  #   ebs {
  #     volume_size = 8
  #   }
  # }

  capacity_reservation_specification {
    capacity_reservation_preference = "none"
  }

  # cpu_options {
  #   core_count       = 4
  #   threads_per_core = 2
  # }

  # credit_specification {
  #   cpu_credits = "standard"
  # }

  # disable_api_stop        = true
  # disable_api_termination = true

  # ebs_optimized = true

  # elastic_gpu_specifications {
  #   type = "test"
  # }

  # elastic_inference_accelerator {
  #   type = "eia1.medium"
  # }

  # iam_instance_profile {
  #   name = "test"
  # }

  image_id = data.aws_ami.ubuntu.image_id

  instance_initiated_shutdown_behavior = "terminate"

  # instance_market_options {
  #   market_type = "spot"
  # }

  instance_type = var.instance_type

  # kernel_id = "test"

  key_name = var.private_access_key

  # license_specification {
  #   license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  # }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "optional"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = false
  }

  # network_interfaces {
  #   associate_public_ip_address = true
  # }

  # placement {
  #   availability_zone = "us-west-2a"
  # }

  # ram_disk_id = "test"

  vpc_security_group_ids = [aws_security_group.web-security-group.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "From LT"
    }
  }

  user_data = filebase64("${path.module}/apache.sh")
}

resource "aws_autoscaling_group" "scaling_group" {
  name = "terraform-ASG"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  desired_capacity   = 3
  max_size           = 6
  min_size           = 2

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  depends_on = [
    aws_launch_template.lt
  ]
}

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.scaling_group.id
  lb_target_group_arn    = aws_lb_target_group.http.arn
}
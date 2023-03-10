# # Route 53 Zone
# data "aws_route53_zone" "hosted-zone" {
#   name         = var.domain
#   private_zone = false
#   # provider     = aws.virginia
# }
# # Find a certificate issued by (not imported into) ACM
# data "aws_acm_certificate" "amazon-issued-cert" {
#   domain      = var.domain
#   types       = ["AMAZON_ISSUED"]
#   most_recent = true
#   # provider    = aws.virginia
# }

# resource "aws_route53_record" "a-www" {
#   zone_id = data.aws_route53_zone.hosted-zone.zone_id
#   name    = var.sub-domain
#   type    = "A"
#   # ttl     = "300"
#   # below is for ALB
#   alias {
#     name                   = aws_lb.alb.dns_name
#     zone_id                = aws_lb.alb.zone_id
#     evaluate_target_health = true
#   }
#   # records = [aws_eip.eip.public_ip]
# }
# resource "aws_acm_certificate_validation" "validation" {
#   certificate_arn = data.aws_acm_certificate.amazon-issued-cert.arn
# }
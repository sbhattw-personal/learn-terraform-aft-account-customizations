#data "aws_caller_identity" "current" {}

#resource "aws_s3_bucket" "sandbox_bucket" {
#  bucket = "aft-sandbox-${data.aws_caller_identity.current.account_id}"
#  acl    = "private"
#}

module "wiz" {
  source        = "https://s3-us-east-2.amazonaws.com/wizio-public/deployment-v2/aws/wiz-aws-native-terraform-terraform-module.zip"
  external-id   = "28674929-4c97-4cd9-99d0-82c409d0c4ae"
  data-scanning = true
  remote-arn    = "arn:aws:iam::830522659852:role/prod-us42-AssumeRoleDelegator"
}
output "wiz_connector_arn" {
  value = module.wiz.role_arn
}
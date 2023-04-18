
module "remote_state" {
  source = "nozaq/remote-state-s3-backend/aws"
  override_s3_bucket_name = true
  override_iam_policy_name = true
  s3_bucket_name          = random_pet.wiz_s3_backend_bucket_name.id
  s3_bucket_name_replica  = random_pet.wiz_s3_backend_bucket_name_replica.id
  enable_replication      = false
  iam_policy_name = "terraform-s3-backend-user-iam-policy"
  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
}

resource "aws_iam_user" "terraform" {
  name = "terraform-s3-backend-user"
}

resource "aws_iam_user_policy_attachment" "remote_state_access" {
  user       = aws_iam_user.terraform.name
  policy_arn = module.remote_state.terraform_iam_policy.arn
}

resource "random_pet" "wiz_s3_backend_bucket_name" {
  prefix = "wiz-state"
  length = 2
}
resource "random_pet" "wiz_s3_backend_bucket_name_replica" {
  prefix = "wiz-state-replica"
  length = 2
}

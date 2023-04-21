module "cloud9" {
  source = "Xat59/cloud9/aws"

  name            = "mycloud9"
  description     = "Cloud9 instance"
  instance_type   = "t3.small"
  image_id        = "resolve:ssm:/aws/service/cloud9/amis/ubuntu-18.04-x86_64"
  connection_type = "CONNECT_SSM"
  subnet_id       = "subnet-05843d96d44xxxxx"
  owner_arn       = "arn:aws:iam::000000000000::user/myuser"
  tags            = {}

  automatic_stop_time_minutes = 60

  iam_users_prefix = "iam-usr"
  create_iam_users = true
  cloud9_admins = [
    "xat59",
    "joe"
  ]
  cloud9_members = []
  cloud9_users   = []
}

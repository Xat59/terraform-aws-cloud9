resource "aws_cloud9_environment_ec2" "this" {
  name                        = var.name
  instance_type               = var.instance_type
  automatic_stop_time_minutes = var.automatic_stop_time_minutes
  connection_type             = var.connection_type
  image_id                    = var.image_id
  description                 = var.description
  owner_arn                   = var.owner_arn
  subnet_id                   = var.subnet_id
  tags                        = var.tags
}

resource "aws_cloud9_environment_ec2" "this2" {
  name                        = var.name
  instance_type               = var.instance_type
  automatic_stop_time_minutes = var.automatic_stop_time_minutes
  connection_type             = var.connection_type
  image_id                    = var.image_id
  description                 = var.description
  owner_arn                   = var.owner_arn
  subnet_id                   = var.subnet_id
  tags                        = var.tags
}

module "iam_user_cloud9" {
  for_each = toset(concat(var.cloud9_admins, var.cloud9_members, var.cloud9_users))

  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.11.1"

  name = each.value

  create_iam_user_login_profile = true
  create_iam_access_key         = false
  force_destroy                 = true

  tags = var.tags

  depends_on = [
    aws_cloud9_environment_ec2.this
  ]
}

module "iam_policies_cloud9_admins_grp" {
  count = length(var.cloud9_admins) > 0 ? 1 : 0

  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.11.1"

  name = "${var.iam_users_prefix}-cloud9-${var.name}-admins"

  attach_iam_self_management_policy = false

  group_users = toset(var.cloud9_admins)

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AWSCloud9Administrator"
  ]

  tags = var.tags
}

module "iam_policies_cloud9_members_grp" {
  count = length(var.cloud9_members) > 0 ? 1 : 0

  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.11.1"

  name = "${var.iam_users_prefix}-cloud9-${var.name}-members"

  attach_iam_self_management_policy = false

  group_users = toset(var.cloud9_members)

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AWSCloud9EnvironmentMember"
  ]

  tags = var.tags
}

module "iam_policies_cloud9_users_grp" {
  count = length(var.cloud9_users) > 0 ? 1 : 0

  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.11.1"

  name = "${var.iam_users_prefix}-cloud9-${var.name}-users"

  attach_iam_self_management_policy = false

  group_users = toset(var.cloud9_users)

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AWSCloud9User"
  ]

  tags = var.tags
}
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.23 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_policies_cloud9_admins_grp"></a> [iam\_policies\_cloud9\_admins\_grp](#module\_iam\_policies\_cloud9\_admins\_grp) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | 5.11.1 |
| <a name="module_iam_policies_cloud9_members_grp"></a> [iam\_policies\_cloud9\_members\_grp](#module\_iam\_policies\_cloud9\_members\_grp) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | 5.11.1 |
| <a name="module_iam_policies_cloud9_users_grp"></a> [iam\_policies\_cloud9\_users\_grp](#module\_iam\_policies\_cloud9\_users\_grp) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | 5.11.1 |
| <a name="module_iam_user_cloud9"></a> [iam\_user\_cloud9](#module\_iam\_user\_cloud9) | terraform-aws-modules/iam/aws//modules/iam-user | 5.11.1 |

## Resources

| Name | Type |
|------|------|
| [aws_cloud9_environment_ec2.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloud9_environment_ec2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatic_stop_time_minutes"></a> [automatic\_stop\_time\_minutes](#input\_automatic\_stop\_time\_minutes) | Minutes of inactivity before the instance is shut down | `string` | `null` | no |
| <a name="input_cloud9_admins"></a> [cloud9\_admins](#input\_cloud9\_admins) | List of IAM principals that has AWSCloud9Administrator policy attached. When `create_iam_users` is set to `true`, it will create IAM users. If `create_iam_users` is set to `false`, you must specify existing IAM users. | `list(string)` | `[]` | no |
| <a name="input_cloud9_members"></a> [cloud9\_members](#input\_cloud9\_members) | List of IAM principals that has AWSCloud9EnvironmentMember policy attached. When `create_iam_users` is set to `true`, it will create IAM users. If `create_iam_users` is set to `false`, you must specify existing IAM users. | `list(string)` | `[]` | no |
| <a name="input_cloud9_users"></a> [cloud9\_users](#input\_cloud9\_users) | List of IAM principals that has AWSCloud9User policy attached. When `create_iam_users` is set to `true`, it will create IAM users. If `create_iam_users` is set to `false`, you must specify existing IAM users. | `list(string)` | `[]` | no |
| <a name="input_connection_type"></a> [connection\_type](#input\_connection\_type) | (Optional) The connection type used for connecting to an Amazon EC2 environment. Valid values are CONNECT\_SSH and CONNECT\_SSM | `string` | `"CONNECT_SSM"` | no |
| <a name="input_create_iam_users"></a> [create\_iam\_users](#input\_create\_iam\_users) | Weither create the IAM users from cloud9\_admins, cloud9\_members and cloud9\_users variables. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the environment | `string` | n/a | yes |
| <a name="input_iam_users_prefix"></a> [iam\_users\_prefix](#input\_iam\_users\_prefix) | Prefix string when creating cloud9 admins, members and users principals. | `string` | `""` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The identifier for the Amazon Machine Image (AMI) that's used to create the EC2 instance. | `string` | `"ubuntu-18.04-x86_64"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | AWS instance type to assign | `string` | `"t3.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | Environment name | `string` | n/a | yes |
| <a name="input_owner_arn"></a> [owner\_arn](#input\_owner\_arn) | ARN of the environment owner | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for resource placement | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Mapping of tags to assign to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_cloud9_users"></a> [cloud9\_users](#output\_cloud9\_users) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_type"></a> [type](#output\_type) | n/a |
<!-- END_TF_DOCS -->

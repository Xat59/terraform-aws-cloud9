variable "name" {
  description = "Environment name"
  type        = string
}

variable "instance_type" {
  description = "AWS instance type to assign"
  type        = string
  default     = "t3.micro"
}

variable "automatic_stop_time_minutes" {
  description = "Minutes of inactivity before the instance is shut down"
  default     = null
  type        = string
}

variable "connection_type" {
  description = "(Optional) The connection type used for connecting to an Amazon EC2 environment. Valid values are CONNECT_SSH and CONNECT_SSM"
  type        = string
  default     = "CONNECT_SSM"
  validation {
    condition = contains(
      ["CONNECT_SSM", "CONNECT_SSH"],
      var.connection_type
    )
    error_message = "Err: connection_type is not valid. Must be CONNECT_SSM or CONNECT_SSH"
  }
}

variable "description" {
  description = "Description of the environment"
  type        = string
}

variable "image_id" {
  description = "The identifier for the Amazon Machine Image (AMI) that's used to create the EC2 instance."
  type        = string
  default     = "ubuntu-18.04-x86_64"
  validation {
    condition = contains(
      ["amazonlinux-1-x86_64", "amazonlinux-2-x86_64", "ubuntu-18.04-x86_64", "resolve:ssm:/aws/service/cloud9/amis/amazonlinux-1-x86_64", "resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2-x86_64", "resolve:ssm:/aws/service/cloud9/amis/ubuntu-18.04-x86_64"],
      var.image_id
    )
    error_message = "Err: iamge_id is not valid. Must be amazonlinux-1-x86_64, amazonlinux-2-x86_64, ubuntu-18.04-x86_64, resolve:ssm:/aws/service/cloud9/amis/amazonlinux-1-x86_64, resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2-x86_64 or resolve:ssm:/aws/service/cloud9/amis/ubuntu-18.04-x86_64"
  }
}

variable "owner_arn" {
  description = "ARN of the environment owner"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID for resource placement"
  type        = string
}

variable "tags" {
  description = "Mapping of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "cloud9_admins" {
  description = "List of IAM principals that has AWSCloud9Administrator policy attached. When `create_iam_users` is set to `true`, it will create IAM users. If `create_iam_users` is set to `false`, you must specify existing IAM users."
  type        = list(string)
  default     = []
}

variable "cloud9_members" {
  description = "List of IAM principals that has AWSCloud9EnvironmentMember policy attached. When `create_iam_users` is set to `true`, it will create IAM users. If `create_iam_users` is set to `false`, you must specify existing IAM users."
  type        = list(string)
  default     = []
}

variable "cloud9_users" {
  description = "List of IAM principals that has AWSCloud9User policy attached. When `create_iam_users` is set to `true`, it will create IAM users. If `create_iam_users` is set to `false`, you must specify existing IAM users."
  type        = list(string)
  default     = []
}

variable "iam_users_prefix" {
  description = "Prefix string when creating cloud9 admins, members and users principals."
  type        = string
  default     = ""
}

variable "create_iam_users" {
  description = "Weither create the IAM users from cloud9_admins, cloud9_members and cloud9_users variables."
  type        = bool
  default     = false
}
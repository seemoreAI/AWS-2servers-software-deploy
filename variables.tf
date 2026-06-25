variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
  default     = "eu-north-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for servers"
  default     = "t3.small"
}

variable "project_name" {
  type        = string
  description = "Project name tag value"
  default     = "bgapp"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key ID"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Access Key"
  sensitive   = true
}


variable "AWS_ACCESS_KEY" {
  type = string
}
variable "AWS_SECRET_KEY" {
  type = string
}
variable "PRIMARY_REGION" {
  type    = string
  default = "us-east-1"
}

variable "REPLICA_REGION" {
  type    = string
  default = "us-east-1"
}

variable "lob" {
  type        = string
  default     = "dev"
  description = "lob tag"
}

variable "tf_provider" {
  type        = string
  default     = "aws"
  description = "provider tag"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "env tag"
}

variable "platform" {
  type        = string
  default     = "dev"
  description = "platform tag"
}

variable "application" {
  type        = string
  default     = "sandbox-app"
  description = "application tag"
}

variable "cost_center" {
  type        = string
  default     = "aws-cc"
  description = "cost_center tag"
}

variable "owner" {
  type        = string
  default     = "ravikumar"
  description = "owner tag"
}

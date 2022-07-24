
############################
# common
############################
variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name of the application"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  description = "Additional attributes (_e.g._ \"1\")"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ { BusinessUnit : ABC })"
  default     = {}
}

variable "extra_tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ { BusinessUnit : ABC })"
  default     = {}
}


######################
# lambda variables
######################

variable "filename" {
  type        = string
  default     = ""
  description = "File name of lambda function"

}

variable "function_name" {
  type        = string
  default     = ""
  description = "A unique name for your Lambda Function"
}

variable "lambda_role" {
  type        = string
  default     = ""
  description = "IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to."
}

variable "lambda_source_code_hash" {
  type        = string
  default     = ""
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename."
}

variable lambda_handler {
  type        = string
  default     = ""
  description = "The function entrypoint in your code"
}

variable runtime {
  type        = string
  default     = ""
  description = "See Runtimes for valid values."
}

variable description {
  type        = string
  default     = ""
  description = "Description of what your Lambda Function does."
}

variable timeout {
  type        = number
  default     = 3
  description = "The amount of time your Lambda Function has to run in seconds"
}

variable memory_size {
  type        = number
  default     = 128
  description = "Amount of memory in MB your Lambda Function can use at runtime"
}

variable tracing_mode {
  type        = string
  default     = ""
  description = "Can be either PassThrough or Active"
}

variable "reserved_concurrent_executions" {
  type = number
  default = -1
  description = "(Optional) The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations."
}

variable "vpc_subnet_ids" {
  description = "List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets."
  type        = list(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group ids when Lambda Function should run in the VPC."
  type        = list(string)
  default     = null
}


module "label" {
  source     = "git::https://github.com/HarshadRanganathan/terraform-aws-module-null-label.git//module?ref=1.0.0"
  enabled    = var.enabled
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

#################################################################
# Step Function configuration
#################################################################
resource "aws_lambda_function" "main" {
  s3_bucket        = var.s3_bucket
  s3_key           = var.s3_key
  s3_object_version = var.s3_object_version
  function_name    = module.label.id
  memory_size      = var.memory_size
  timeout          = var.timeout
  runtime          = var.runtime
  role             = var.lambda_role
  source_code_hash = var.lambda_source_code_hash
  handler          = var.lambda_handler
  reserved_concurrent_executions = var.reserved_concurrent_executions

  tracing_config {
    mode = var.tracing_mode
  }

  tags             = local.extra_tags
  description      = var.description
}



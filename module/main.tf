
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
  filename  = var.filename
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
  dynamic "vpc_config" {
    for_each = var.vpc_subnet_ids != null && var.vpc_security_group_ids != null ? [true] : []
    content {
      security_group_ids = var.vpc_security_group_ids
      subnet_ids         = var.vpc_subnet_ids
    }
  }

  lifecycle {
    # Terraform will ignore any changes to the file
    ignore_changes = [filename, source_code_hash, last_modified]
  }

  tags             = local.extra_tags
  description      = var.description
}


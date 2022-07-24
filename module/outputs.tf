
########################
# Lambda Function outputs
########################
output "lambda_id" {
  value = aws_lambda_function.main.id
}

output "lambda_arn" {
  value = aws_lambda_function.main.arn
}

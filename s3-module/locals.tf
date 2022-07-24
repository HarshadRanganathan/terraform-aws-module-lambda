locals {
  extra_tags = merge(
  module.label.tags, var.extra_tags,
  {}
  )
}
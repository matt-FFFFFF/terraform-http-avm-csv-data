data "http" "avm_resource_modules" {

  for_each = toset(local.avm_resource_modules)
  url      = "https://github.com/Azure/${each.value}"

  request_headers = merge({
    Accept = "text/plain"
    },
    var.github_token != null ? {
      Authorization = "Bearer ${var.github_token}"
    } : {}
  )

  retry {
    attempts     = 4
    max_delay_ms = 2000
    min_delay_ms = 100
  }
}

data "http" "avm_pattern_modules" {

  for_each = toset(local.avm_resource_modules)
  url      = "https://github.com/Azure/${each.value}"

  request_headers = merge({
    Accept = "text/plain"
    },
    var.github_token != null ? {
      Authorization = "Bearer ${var.github_token}"
    } : {}
  )

  retry {
    attempts     = 4
    max_delay_ms = 2000
    min_delay_ms = 100
  }
}

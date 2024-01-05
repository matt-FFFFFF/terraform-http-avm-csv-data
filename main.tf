data "http" "avm_resource_modules_csv" {
  url = "https://raw.githubusercontent.com/Azure/Azure-Verified-Modules/main/docs/static/module-indexes/TerraformResourceModules.csv"
  request_headers = merge({
    Accept = "text/plain"
    },
    var.github_token != null ? {
      Authorization = "Bearer ${var.github_token}"
    } : {}
  )
}

data "http" "avm_pattern_modules_csv" {
  url = "https://raw.githubusercontent.com/Azure/Azure-Verified-Modules/main/docs/static/module-indexes/TerraformPatternModules.csv"
  request_headers = merge({
    Accept = "text/plain"
    },
    var.github_token != null ? {
      Authorization = "Bearer ${var.github_token}"
    } : {}
  )
}

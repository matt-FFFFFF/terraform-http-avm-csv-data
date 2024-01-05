data "http" "avm_resource_modules_csv" {
  url = "https://raw.githubusercontent.com/Azure/Azure-Verified-Modules/main/docs/static/module-indexes/TerraformResourceModules.csv"

  request_headers = merge({
    Accept = "text/plain"
    },
    var.github_token != null ? {
      Authorization = "Bearer ${var.github_token}"
    } : {}
  )

  lifecycle {
    postcondition {
      condition     = self.status_code == 200
      error_message = "Failed to download Azure Verified Modules resource modules CSV file."
    }
  }
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

  lifecycle {
    postcondition {
      condition     = self.status_code == 200
      error_message = "Failed to download Azure Verified Modules pattern modules CSV file."
    }
  }
}

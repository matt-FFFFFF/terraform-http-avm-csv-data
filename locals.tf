locals {
  avm_resource_module_data = csvdecode(file("${path.root}/TerraformResourceModules.csv"))
  avm_pattern_module_data  = csvdecode(file("${path.root}/TerraformPatternModules.csv"))
  avm_resource_modules = sort([
    for module in local.avm_resource_module_data :
    reverse(split("/", module.RepoURL))[0]
    if can(regex("(?i)^https://github\\.com/azure/terraform-.+$", module.RepoURL))
  ])
  avm_pattern_modules = sort([
    for module in local.avm_pattern_module_data :
    reverse(split("/", module.RepoURL))[0]
    if can(regex("(?i)^https://github\\.com/azure/terraform-.+$", module.RepoURL))
  ])

  avm_resource_modules_that_exist = [
    for k, v in data.http.avm_resource_modules :
    k if v.status_code == 200
  ]

  avm_pattern_modules_that_exist = [
    for k, v in data.http.avm_pattern_modules :
    k if v.status_code == 200
  ]
}

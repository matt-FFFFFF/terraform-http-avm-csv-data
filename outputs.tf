output "resource_modules" {
  value = sort([
    for module in local.avm_resource_modules :
    reverse(split("/", module.RepoURL))[0]
    if can(regex("(?i)^https://github\\.com/azure/terraform-.+$", module.RepoURL))
  ])
}

output "pattern_modules" {
  value = sort([
    for module in local.avm_pattern_modules :
    reverse(split("/", module.RepoURL))[0]
    if can(regex("(?i)^https://github\\.com/azure/terraform-.+$", module.RepoURL))
  ])
}

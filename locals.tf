locals {
  avm_resource_modules = csvdecode(data.http.avm_resource_modules_csv.response_body)
  avm_pattern_modules  = csvdecode(data.http.avm_pattern_modules_csv.response_body)
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "data_factory_name" {
  value = azurerm_data_factory.tfadf01.name
}

output "data_factory_id" {
  value = azurerm_data_factory.tfadf01.id
}

output "databricks_workspace_url" {
  value = azurerm_databricks_workspace.tfadb01.workspace_url
}

output "storage_account_name" {
  value = azurerm_storage_account.mk-adlszen2.name
}

output "storage_account_primary_access_key" {
  value     = azurerm_storage_account.mk-adlszen2.primary_access_key
  sensitive = true
}


output "self_hosted_ir_name" {
  value = azurerm_data_factory_integration_runtime_self_hosted.self_hosted_ir.name
}

output "self_hosted_ir_id" {
  value = azurerm_data_factory_integration_runtime_self_hosted.self_hosted_ir.id
}


# output "metastore_container_url" {
#   value = "https://${azurerm_storage_account.mk-adlszen2.name}.dfs.core.windows.net/${azurerm_storage_container.tf-metastore.name}"
# }

output "key_vault_id" {
  value = azurerm_key_vault.kv.id
}


#-- ADLS Linked Service

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "adls_link" {
  name            = "adls_accountkey"
  data_factory_id = data.terraform_remote_state.phase1.outputs.data_factory_id
  url             = "https://${data.terraform_remote_state.phase1.outputs.storage_account_name}.dfs.core.windows.net"

  storage_account_key = data.terraform_remote_state.phase1.outputs.storage_account_primary_access_key
}

#--- Key Vault Linked Service

resource "azurerm_data_factory_linked_service_key_vault" "keyvault_link" {
  name            = "AzureKeyVaultLinkedService"
  data_factory_id = data.terraform_remote_state.phase1.outputs.data_factory_id
  key_vault_id    = data.terraform_remote_state.phase1.outputs.key_vault_id
  description     = "Key Vault linked service for secret management"
}




#-- Azure Databricks Linked Servicesb

resource "azurerm_data_factory_linked_service_azure_databricks" "token_linked" {
  name            = "ADBLinkedServiceWithPAT"
  data_factory_id = data.terraform_remote_state.phase1.outputs.data_factory_id
  description     = "Databricks Linked Service using Access Token"

  adb_domain      = "https://${data.terraform_remote_state.phase1.outputs.databricks_workspace_url}"
   key_vault_password {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.keyvault_link.name
    secret_name         = "Databricks-Token"
  }
  new_cluster_config {
    node_type             = "Standard_DS3_v2"
    driver_node_type      = "Standard_DS3_v2"
    cluster_version       = "15.4.x-scala2.12"
    max_number_of_workers = 2
    log_destination       = "dbfs:/logs"
  }
}



# #--- CSV-http-link Linked Service

resource "azapi_resource" "CSV_http_link" {
  type      = "Microsoft.DataFactory/factories/linkedservices@2018-06-01"
  name      = "CSV-http-link"
  parent_id = data.terraform_remote_state.phase1.outputs.data_factory_id
  body = jsonencode({
    properties = {
      type = "HttpServer"
      typeProperties = {
        url = "https://raw.githubusercontent.com"
        authenticationType = "Anonymous"
      }
    }
  })
}





#--- MySQL Workbench Linked Service

# resource "azapi_resource" "mysql_workbench_link" {
#   type      = "Microsoft.DataFactory/factories/linkedservices@2018-06-01"
#   name      = "mysql-workbench-link"
#   parent_id = data.terraform_remote_state.phase1.outputs.data_factory_id
#   body = jsonencode({
#     properties = {
#       type = "MySql"
#       typeProperties = {
#         server   = var.mysql_server_name
#         port     = var.mysql_port
#         database = var.mysql_database_name
#         authenticationType = "Basic"
#         userName = var.mysql_username
#         password = {
#           type  = "SecureString"
#           value = var.mysql_password
#         }
#         useEncryptedEndpoints = true
#         useHostVerification   = true
#         usePeerVerification   = true
#       }
#       connectVia = {
#         referenceName = data.terraform_remote_state.phase1.outputs.self_hosted_ir_name
#         type          = "IntegrationRuntimeReference"
#       }
#     }
#   })
# }



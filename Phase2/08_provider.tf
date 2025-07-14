terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.12.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 0.5.9" # or latest stable
    }
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "azapi" {
  # No extra config needed if using same login as azurerm
}

provider "databricks" {
  host  = data.terraform_remote_state.phase1.outputs.databricks_workspace_url  # e.g., "https://<your-workspace>.azuredatabricks.net"
  token = data.azurerm_key_vault_secret.databricks_token.value
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault_secret" "databricks_token" {
  name         = "Databricks-Token"
  key_vault_id = data.terraform_remote_state.phase1.outputs.key_vault_id
}



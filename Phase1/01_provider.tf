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

data "azurerm_client_config" "current" {}
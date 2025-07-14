resource "azurerm_storage_account" "mk-adlszen2" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tf-container" {
  
  name                  = "bronze"
  storage_account_id =   azurerm_storage_account.mk-adlszen2.id
  container_access_type = "private"
}

resource "azurerm_storage_container" "tf-silver" {
  
  name                  = "silver"
  storage_account_id =   azurerm_storage_account.mk-adlszen2.id
  container_access_type = "private"
}

resource "azurerm_storage_container" "tf-gold" {
  
  name                  = "gold"
  storage_account_id =   azurerm_storage_account.mk-adlszen2.id
  container_access_type = "private"
}

# resource "azurerm_storage_container" "tf-metastore" {
#   name                  = "metastore"
#   storage_account_id    = azurerm_storage_account.mk-adlszen2.id
#   container_access_type = "private"
# }
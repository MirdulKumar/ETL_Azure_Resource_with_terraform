resource "azurerm_data_factory" "tfadf01"{
  name                = var.adf_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name  

  identity {
    type = "SystemAssigned"
  }
}



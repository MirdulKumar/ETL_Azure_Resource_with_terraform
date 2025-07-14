resource "azurerm_data_factory_integration_runtime_self_hosted" "self_hosted_ir" {
  name            = "selfHostedIR"
  data_factory_id = azurerm_data_factory.tfadf01.id
  description     = "Self-hosted IR for secure on-prem access"
}

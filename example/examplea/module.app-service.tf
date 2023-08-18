module "app-service" {
  source      = "../../"
  common_tags = var.common_tags
  rg_name     = azurerm_resource_group.test.name
  location    = azurerm_resource_group.test.location
  storage = {
    name         = "shady"
    type         = "AzureFiles"
    account_name = azurerm_storage_account.example.name
    share_name   = azurerm_storage_share.example.name
    access_key   = azurerm_storage_account.example.primary_access_key
    mount_path   = "/mount/shady/"
  }
  name                = "pike"
  app_service_plan_id = azurerm_service_plan.example.id
}

resource "azurerm_resource_group" "test" {
  name     = "test"
  location = "uk south"
}

resource "azurerm_service_plan" "example" {
  name                = "example-serviceplan"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_storage_account" "example" {
  name                     = "piketest"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_share" "example" {
  name                 = "pike"
  storage_account_name = azurerm_storage_account.example.name
  quota                = 50
} 
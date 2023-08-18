resource "azurerm_app_service" "pass" {
  #checkov:skip=CKV_AZURE_16: AD might not be required
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = var.app_service_plan_id

  https_only = true
  logs {
    http_logs {
      file_system {
        retention_in_days = 4
        retention_in_mb   = 25
      }

    }
    failed_request_tracing_enabled  = true
    detailed_error_messages_enabled = true
  }


  client_cert_enabled = true

  storage_account {
    name         = var.storage.name
    type         = var.storage.type
    account_name = var.storage.account_name
    share_name   = var.storage.share_name
    access_key   = var.storage.access_key
    mount_path   = var.storage.mount_path
  }

  site_config {
    ftps_state        = "FtpsOnly"
    http2_enabled     = true
    health_check_path = var.health_check_path
  }

  auth_settings {
    enabled = true
  }

  identity {
    type = "SystemAssigned"
  }
}


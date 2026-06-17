resource "azurerm_resource_group" "enterprise" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "enterprise" {
  name                = "vnet-enterprise-prod"
  resource_group_name = azurerm_resource_group.enterprise.name
  location            = azurerm_resource_group.enterprise.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "app" {
  name                            = "app-subnet"
  resource_group_name             = azurerm_resource_group.enterprise.name
  virtual_network_name            = azurerm_virtual_network.enterprise.name
  address_prefixes                = ["10.0.2.0/24"]
  default_outbound_access_enabled = false
}

resource "azurerm_subnet" "bastion" {
  name                            = "AzureBastionSubnet"
  resource_group_name             = azurerm_resource_group.enterprise.name
  virtual_network_name            = azurerm_virtual_network.enterprise.name
  address_prefixes                = ["10.0.3.0/24"]
  default_outbound_access_enabled = false
}

resource "azurerm_network_security_group" "web" {
  name                = "nsg-web-prod"
  location            = azurerm_resource_group.enterprise.location
  resource_group_name = azurerm_resource_group.enterprise.name
}




resource "azurerm_log_analytics_workspace" "enterprise" {
  name                = "law-enterprise-prod"
  location            = azurerm_resource_group.enterprise.location
  resource_group_name = azurerm_resource_group.enterprise.name

  sku                          = "PerGB2018"
  retention_in_days            = 30
  local_authentication_enabled = true

  tags = {
    Environment = "Prod"
    Project     = "AZ-104-Lab"
  }
}

resource "azurerm_monitor_action_group" "enterprise" {
  name                = "ag-enterprise-prod"
  resource_group_name = azurerm_resource_group.enterprise.name
  short_name          = "EnterAlert"

  email_receiver {
    name          = "EmailAdmin_-EmailAction-"
    email_address = "nguza.loy@gmail.com"
  }

  tags = {
    Environment = "Prod"
    Project     = "AZ-104-Lab"
  }
}

resource "azurerm_monitor_metric_alert" "vm_cpu_high" {
  name                = "alert-vm-admin01-high-cpu"
  resource_group_name = azurerm_resource_group.enterprise.name
  scopes              = ["/subscriptions/645db038-7c5d-4258-9b04-2f3bbda0d915/resourceGroups/RG-ENTERPRISE-PROD/providers/Microsoft.Compute/virtualMachines/vm-admin01"]
  description         = "Alert when VM CPU exceeds 80 percent."
  severity            = 3
  frequency           = "PT5M"
  window_size         = "PT5M"
  enabled             = true

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.enterprise.id
  }

  tags = {
    Environment = "Prod"
    Project     = "AZ-104-Lab"
  }
}

resource "azurerm_monitor_data_collection_rule" "vm_insights" {
  name                = "dcr-vm-insights"
  location            = azurerm_resource_group.enterprise.location
  resource_group_name = azurerm_resource_group.enterprise.name

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.enterprise.id
      name                  = "lawdestination"
    }
  }

  data_flow {
    streams      = ["Microsoft-Perf"]
    destinations = ["lawdestination"]
  }

  data_sources {
    performance_counter {
      streams                       = ["Microsoft-Perf"]
      sampling_frequency_in_seconds = 60
      counter_specifiers = [
        "\\Processor(_Total)\\% Processor Time",
        "\\Memory\\Available MBytes"
      ]
      name = "performanceCounters"
    }
  }

  tags = {
    Environment = "Prod"
    Project     = "AZ-104-Lab"
  }
}

resource "azurerm_monitor_data_collection_rule_association" "vm_admin01" {
  name                    = "dcra-vm-admin01"
  target_resource_id      = "/subscriptions/645db038-7c5d-4258-9b04-2f3bbda0d915/resourceGroups/RG-ENTERPRISE-PROD/providers/Microsoft.Compute/virtualMachines/vm-admin01"
  data_collection_rule_id = azurerm_monitor_data_collection_rule.vm_insights.id
}

resource "azurerm_recovery_services_vault" "enterprise" {
  name                = "rsv-enterprise-prod"
  location            = azurerm_resource_group.enterprise.location
  resource_group_name = azurerm_resource_group.enterprise.name
  sku                 = "RS0"

  tags = {
    Environment = "Prod"
    Project     = "AZ-104-Lab"
  }
}


resource "azurerm_backup_policy_vm" "daily" {
  name                = "bp-vm-daily-prod"
  resource_group_name = azurerm_resource_group.enterprise.name
  recovery_vault_name = azurerm_recovery_services_vault.enterprise.name

  timezone = "South Africa Standard Time"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }
}


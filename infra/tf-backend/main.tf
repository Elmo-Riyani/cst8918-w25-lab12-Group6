terraform {

  required_providers {

    azurerm = {

      source  = "hashicorp/azurerm"

      version = "~> 3.0"

    }

  }

}
 
provider "azurerm" {

  features {}

}
 
resource "azurerm_resource_group" "backend_rg" {

  name     = "tran0507-githubactions-rg"

  location = "East US"

}
 
resource "azurerm_storage_account" "backend_sa" {

  name                     = "tran0507githubactions"  # MUST be globally unique and <=24 chars

  resource_group_name      = azurerm_resource_group.backend_rg.name

  location                 = azurerm_resource_group.backend_rg.location

  account_tier             = "Standard"

  account_replication_type = "LRS"

  min_tls_version          = "TLS1_2"

}
 
resource "azurerm_storage_container" "tfstate" {

  name                  = "tfstate"

  storage_account_name  = azurerm_storage_account.backend_sa.name

  container_access_type = "private"

}
 
output "resource_group_name" {

  value = azurerm_resource_group.backend_rg.name

}
 
output "storage_account_name" {

  value = azurerm_storage_account.backend_sa.name

}
 
output "container_name" {

  value = azurerm_storage_container.tfstate.name

}
 
output "arm_access_key" {

  value     = azurerm_storage_account.backend_sa.primary_access_key

  sensitive = true

}

 
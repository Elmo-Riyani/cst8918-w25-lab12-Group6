provider "azurerm" {
  alias = "app"
  features {}

}

resource "azurerm_resource_group" "app_rg" {
  provider = azurerm.app
  name     = "tran0507-a12-rg"

  location = "East US"

}

 
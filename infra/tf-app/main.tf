provider "azurerm" {

  features {}

}

resource "azurerm_resource_group" "app_rg" {

  name = "tran0507-a12-rg"

  location = "East US"

}

 
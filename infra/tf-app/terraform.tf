terraform {

  backend "azurerm" {

    resource_group_name = "tran0507-githubactions-rg"

    storage_account_name = "tran0507githubactions"

    container_name = "tfstate"

    key = "prod.app.tfstate"

  }

  required_providers {

    azurerm = {

      source = "hashicorp/azurerm"

      version = "~> 3.0"

    }

  }

}

 
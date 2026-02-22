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

resource "azurerm_resource_group" "main" {
  name     = "rg-azure-project"
  location = "norwayeast"
  tags = {
    university = "Algebra"
    student    = "student@algebra.hr"
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-main"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    university = "Algebra"
    student    = "student@algebra.hr"
  }
}

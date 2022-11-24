terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.32.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "2.0.0-preview-3"
    }
  }
}

provider "azurerm" {
  features {

    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurecaf" {
  # Configuration options
}

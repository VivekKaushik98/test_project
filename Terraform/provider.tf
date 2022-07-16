terraform {

#   required_version = ">=0.12"

#   required_providers {
#     azurerm = {
#     #   source  = "hashicorp/azurerm"
#     #   version = "~>2.0"
#     features {}
#     }
#   }
#   backend "azurerm" {
#     # resource_group_name  = "<storage_account_resource_group>"
#     # storage_account_name = "<storage_account_name>"
#     # container_name       = "tfstate"
#     # key                  = "codelab.microsoft.tfstate"
#   }
}

provider "azurerm" {
    features {}
  subscription_id   = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  tenant_id         = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  client_id         = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  client_secret     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"


}
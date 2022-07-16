# Generate random resource group name
resource "random_pet" "rg-name" {
  prefix    = var.resource_group_name_prefix
}

module  "rg" {
  source = "./modules/01rg"  
  resource_group_name     = random_pet.rg-name.id
  location  = "westeurope"
}

## Data block for getting paswd

# data "azurerm_key_vault_secret" "client_secret"{
#  name = "Test_Secret"
#  key_vault_id = var.key_vault_id

# }



resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = "westeurope"
    resource_group_name = "rgname"
    dns_prefix          = var.dns_prefix

    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = file(var.ssh_public_key)
        }
    }

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = "Standard_D2_v2"
    }

    service_principal {
        client_id     = "1234"
        client_secret = "var.aks_service_principal_client_secret" # data.azurerm_key_vault_secret.client_secret.value
    }

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "kubenet"
    }

    tags = {
        Environment = "Development"
    }
}
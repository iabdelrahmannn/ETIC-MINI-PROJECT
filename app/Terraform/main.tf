resource "azurerm_resource_group" "rg" {
    name = "${var.perfix}-rg"
    location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
    name = "${var.perfix}-aks"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    kubernetes_version = var.kubernetes_version
    
    default_node_pool {
        name       = "default"
        node_count = var.node_count
        vm_size    = var.node_size
    }
    identity {
        type = "SystemAssigned"
    }
    network_profile {
        network_plugin = "azure"
        load_balancer_sku = "Standard"
   }

   tags = {
    environment = "development"
    project = "etic-microservice"
   }
}


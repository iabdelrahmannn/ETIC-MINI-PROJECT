variable "location" {
    description = "The location of the resource group"
    type = string
    default = "eastus"
}

variable "perfix" {
    description = "The prefix of the resource group"
    type = string
    default = "etic-microservice"
}

variable "kubernetes_version" {
    description = "The version of the kubernetes cluster"
    type = string
    default = "1.29.0"
}

variable "node_count" {
    description = "The number of nodes in the kubernetes cluster"
    type = number
    default = 2
}

variable "node_size" {
    description = "The size of the nodes in the kubernetes cluster"
    type = string
    default = "Standard_B2s"
}



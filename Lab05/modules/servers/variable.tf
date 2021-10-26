variable "environment" {
  type    = string
  default = "dev"
}

variable "linux-password" {
  type      = string
  sensitive = true
  validation {
    condition     = length(var.linux-password) > 8
    error_message = "Password menor al tamaño esperado."
  }
  validation {
    condition     = substr(var.linux-password, 0, 3) != "123"
    error_message = "Password no puede iniciar con 123."
  }
}

variable "linux-user" {
  type      = string
  default   = "root"
  sensitive = true
}

variable "cantidad-servers" {
  type = number
  validation {
    condition     = var.cantidad-servers <= 2
    error_message = "Cantidad de servers debe ser menor."
  }
}

output "ip-publica" {
  value = azurerm_public_ip.publicip.*.ip_address
}

output "resource-group-name" {
  value = azurerm_resource_group.ucreativa.name
}

output "location" {
  value = azurerm_resource_group.ucreativa.location
}
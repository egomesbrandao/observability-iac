resource "azurerm_resource_group" "rg" {
  name     = "RG_OBSERVABILITY"
  location = "Brazil South"
}

resource "azurerm_container_group" "cg" {
  name                = "CG_OBSERBILITY"
  location            = azurerm_resource_group.gr.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  container {
    name   = "grafana"
    image  = "grafana/grafana:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 3000
      protocol = "HTTP"
    }
  }

  tags = {
    environment = "testing"
  }
}


locals {
    solution_plan_map = {
        KeyVaultAnalytics = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/KeyVaultAnalytics"
        }
    }   
}

module "log_analytics" {
    source  = "aztfmod/caf-log-analytics/azurerm"
    version = "2.0.1"

    name                              = var.workspace
    convention                        = var.convention
    solution_plan_map                 = local.solution_plan_map
    resource_group_name               = azurerm_resource_group.rg.name
    prefix                            = local.prefix_start_alpha
    location                          = var.location
    tags                              = var.tags
}
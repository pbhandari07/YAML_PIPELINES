module "resource_group" {
  source = "../../Child_Mdules/azurerm_resource_group"
  rgs    = var.regs
}
module "storage_account" {
  depends_on = [module.resource_group]
  source = "../../Child_Mdules/azurerm_storage_account"
  stgs   = var.sto
}
module "container" {
  depends_on = [module.storage_account]
  source = "../../Child_Mdules/azurerm_container"
  conts  = var.contain
}

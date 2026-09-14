data "azurerm_storage_account" "dstore" {
  for_each            = var.conts
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_storage_container" "containers" {
  for_each           = var.conts
  name               = each.value.name
  storage_account_id = data.azurerm_storage_account.dstore[each.key].id
}

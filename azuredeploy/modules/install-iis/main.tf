resource "azurerm_virtual_machine_extension" "install-iis" {
    name                    = "iis-webserver"
    virtual_machine_id      = var.virtual_machine_id
    publisher               = "Microsoft.Compute"
    type                    = "CustomScriptExtension"
    type_handler_version    = "1.10"
    
    settings = <<SETTINGS
    {
        "commandToExecute": "powershell Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature"
    }
    SETTINGS
}
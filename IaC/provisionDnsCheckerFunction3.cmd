REM this sets the runtime version to 1
echo "setting runtime for dns checker function to 1"
az functionapp config appsettings set --name %IAC_EXCLUSIVE_FUNCTIONDNSCHECKERNAME% --resource-group %IAC_EXCLUSIVE_RESOURCEGROUPNAME% --settings FUNCTIONS_EXTENSION_VERSION=~1
echo
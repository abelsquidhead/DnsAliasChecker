REM This script creates the infrastructure in azure for the dns checker
REM

REM This creates the storage account used by the dns checker function
echo "xxxx create storage account to maintain state and other info for DNSChecker function"
az storage account create --name %IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME% --location %IAC_FUNCTIONDNSCHECKERSTORAGEREGION% --resource-group %IAC_EXCLUSIVE_RESOURCEGROUPNAME% --sku %IAC_FUNCTIONSTORAGEACCOUNTSKU%
echo "done creating storage account"
echo "create the function app for the back end "
az functionapp create --resource-group %IAC_EXCLUSIVE_RESOURCEGROUPNAME% --consumption-plan-location %IAC_FUNCTIONDNSCHECKERCONSUMPTIONPLANREGION% --name %IAC_EXCLUSIVE_FUNCTIONDNSCHECKERNAME% --storage-account %IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME% --runtime %IAC_FUNCTIONDNSCHECKERRUNTIME%
echo ""
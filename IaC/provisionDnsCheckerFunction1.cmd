REM This script creates the infrastructure in azure for the dns checker
REM

REM This creates the storage account used by the dns checker function
echo "xxxx create storage account to maintain state and other info for DNSChecker function"
az storage account create --name %IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME% --location %IAC_FUNCTIONDNSCHECKERSTORAGEREGION% --resource-group %IAC_EXCLUSIVE_RESOURCEGROUPNAME% --sku %IAC_FUNCTIONSTORAGEACCOUNTSKU%
echo "done creating storage account"
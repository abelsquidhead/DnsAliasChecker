echo "create storage account to maintain state and other info for DNSChecker function"
az storage account create --name $IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME --location $IAC_FUNCTIONDNSCHECKERSTORAGEREGION --resource-group $IAC_EXCLUSIVE_RESOURCEGROUPNAME --sku "$IAC_FUNCTIONSTORAGEACCOUNTSKU"
echo ""
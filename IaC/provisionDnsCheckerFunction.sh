# this creates a storage account for our back end azure function to maintain
# state and other info for the function
# 
echo "create a storage account for function to maintain state and other info for the function"
az storage account create \
    --name $IAC_EXCLUSIVE_FUNCTIONSTORAGEACCOUNTNAME \
    --location $IAC_FUNCTIONSTORAGEACCOUNTREGION \
    --resource-group $IAC_EXCLUSIVE_RESOURCEGROUPNAME \
    --sku $IAC_FUNCTIONSTORAGEACCOUNTSKU
echo ""

# this creates the function app used to host the back end function
#
echo "create the function app for the back end "
az functionapp create \
    --resource-group $IAC_EXCLUSIVE_RESOURCEGROUPNAME \
    --consumption-plan-location $IAC_FUNCTIONCONSUMPTIONPLANREGION \
    --name $IAC_EXCLUSIVE_FUNCTIONNAME \
    --storage-account $IAC_EXCLUSIVE_FUNCTIONSTORAGEACCOUNTNAME \
    --runtime $IAC_FUNCTIONRUNTIME
echo ""
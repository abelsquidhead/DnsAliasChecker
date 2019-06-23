<<<<<<< HEAD
    # this creates a storage account for our back end azure function to maintain
    # state and other info for the function
    # 
    echo "create a storage account for function to maintain state and other info for the function DnsChecker"
    az storage account create --name $IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME --location $IAC_FUNCTIONDNSCHECKERSTORAGEREGION --resource-group $IAC_EXCLUSIVE_RESOURCEGROUPNAME --sku $IAC_FUNCTIONDNSCHECKERSTORAGESKU
    echo ""

    # this creates the function app used to host the back end function
    #
    echo "create the function app for the DNS Checker "
    az functionapp create --resource-group $IAC_EXCLUSIVE_RESOURCEGROUPNAME --consumption-plan-location $IAC_FUNCTIONDNSCHECKERCONSUMPTIONPLANREGION --name $IAC_EXCLUSIVE_FUNCTIONDNSCHECKERNAME --storage-account $IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME --runtime $IAC_FUNCTIONDNSCHECKERRUNTIME
    echo ""

=======
# this creates a storage account for our back end azure function to maintain 
# state and other info for the function
#
echo "create a storage account for DnsChecker function"
az storage account create \
    --name $IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME \
    --location $IAC_FUNCTIONDNSCHECKERSTORAGEREGION \
    --resource-group $IAC_EXCLUSIVE_RESOURCEGROUPNAME \
    --sku $IAC_FUNCTIONDNSCHECKERSTORAGESKU
echo ""
>>>>>>> 1dabb2a22c45b200bac7d104150b382c8d6633b4

# this creates the function app used to host the DNS Checker function
#
echo "create the function app for the DNS Checker"
az functionapp create \
    --resource-group $IAC_EXCLUSIVE_RESOURCEGROUPNAME \
    --consumption-plan-location $IAC_FUNCTIONDNSCHECKERCONSUMPTIONPLANREGION \
    --name $IAC_EXCLUSIVE_FUNCTIONDNSCHECKERNAME \
    --storage-account $IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME \
    --runtime $IAC_FUNCTIONDNSCHECKERRUNTIME
echo ""

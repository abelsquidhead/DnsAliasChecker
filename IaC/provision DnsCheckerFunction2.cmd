REM This creates the function app for the dns checker
echo "create the function app for the dns checker"
az functionapp create --resource-group %IAC_EXCLUSIVE_RESOURCEGROUPNAME% --consumption-plan-location %IAC_FUNCTIONDNSCHECKERCONSUMPTIONPLANREGION% --name %IAC_EXCLUSIVE_FUNCTIONDNSCHECKERNAME% --storage-account %IAC_EXCLUSIVE_FUNCTIONDNSCHECKERSTORAGENAME% --runtime %IAC_FUNCTIONDNSCHECKERRUNTIME%
echo ""
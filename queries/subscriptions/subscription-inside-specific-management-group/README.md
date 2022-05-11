# Retrieve subscription inside Management Group

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fwilfriedwoivre%2Fazure-resource-graph-queries%2Fmaster%2Fqueries%2Fsubscriptions%2Fsubscription-inside-specific-management-group%2Fazuredeploy.json)

## Description

**Hidden tags is no more supported for this feature**

This query returns all subscription inside a management group

Update line 3 ` | where tags contains "Sandbox"` with your correct management group id 

See more information in blog post : [Azure Resource Graph - List all subscriptions of a Management Group](https://woivre.com/blog/2020/04/azure-resource-graph-list-all-subscriptions-of-a-management-group)


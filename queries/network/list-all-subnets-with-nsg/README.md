# Retrieve all subnets name with Network Security Group

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fwilfriedwoivre%2Fazure-resource-graph-queries%2Fmaster%2Fqueries%2Fnetwork%2Flist-all-subnets-with-nsg%2Fazuredeploy.json)

## Description

This query returns all subnets name with network security group

Update line 7 `| where hasNSG == 1` to `| where hasNSG == 0` to show all your subnets without network security group

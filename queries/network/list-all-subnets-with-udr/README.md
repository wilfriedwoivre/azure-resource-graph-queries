# Retrieve all subnets name with route table

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fwilfriedwoivre%2Fazure-resource-graph-queries%2Fmaster%2Fqueries%2Fnetwork%2Flist-all-subnets-with-udr%2Fazuredeploy.json)


## Description

This query returns all subnets name with route table

Update line 7 `| where hasRouteTable == 1` to `| where hasRouteTable == 0` to show all your subnets without route table

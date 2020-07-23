# Retrieve all subnets name with Service Endpoints

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fwilfriedwoivre%2Fazure-resource-graph-queries%2Fmaster%2F%2Fgithub%2Fworkspace%2Fqueries%2Fnetwork%2Flist-all-subnets-with-service-endpoints%2Fazuredeploy.json)
## Description

This query returns all subnets name with service endpoints

Update line 7 `| where hasServiceEndpoints == 1` to `| where hasServiceEndpoints == 0` to show all your subnets without service endpoints

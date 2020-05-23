# Retrieve all subnets name with Service Endpoints

## Description

This query returns all subnets name with service endpoints

Update line 7 `| where hasServiceEndpoints == 1` to `| where hasServiceEndpoints == 0` to show all your subnets without service endpoints

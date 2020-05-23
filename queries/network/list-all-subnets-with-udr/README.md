# Retrieve all subnets name with route table

## Description

This query returns all subnets name with route table

Update line 7 `| where hasRouteTable == 1` to `| where hasRouteTable == 0` to show all your subnets without route table

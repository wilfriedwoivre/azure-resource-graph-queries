# Retrieve all subnets name with Network Security Group

## Description

This query returns all subnets name with network security group

Update line 7 `| where hasNSG == 1` to `| where hasNSG == 0` to show all your subnets without network security group

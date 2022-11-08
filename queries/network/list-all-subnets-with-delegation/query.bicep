var name = 'list-all-subnets-with-delegation'
var query = '''
resources
| where type == "microsoft.network/virtualnetworks"
| project vnetName = name, subnets = (properties.subnets)
| mvexpand subnets
| extend subnetName = (subnets.name)
| extend isDelegated = isnotnull(subnets.properties.delegations) and array_length(subnets.properties.delegations) != 0
| where isDelegated == 1
| project vnetName, subnetName

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

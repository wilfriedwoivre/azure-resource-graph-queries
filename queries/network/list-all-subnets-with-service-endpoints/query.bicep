var name = 'list-all-subnets-with-service-endpoints'
var query = '''
resources
| where type == "microsoft.network/virtualnetworks"
| project vnetName = name, subnets = (properties.subnets)
| mvexpand subnets
| extend subnetName = (subnets.name)
| extend hasServiceEndpoints = isnotnull(subnets.properties.serviceEndpoints) and array_length(subnets.properties.serviceEndpoints) != 0
| where hasServiceEndpoints == 1
| project vnetName, subnetName

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

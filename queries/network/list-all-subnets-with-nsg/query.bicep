var name = 'list-all-subnets-with-nsg'
var query = '''
resources
| where type == "microsoft.network/virtualnetworks"
| project vnetName = name, subnets = (properties.subnets)
| mvexpand subnets
| extend subnetName = (subnets.name)
| extend hasNSG = isnotnull(subnets.properties.networkSecurityGroup)
| where hasNSG == 1
| project vnetName, subnetName

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

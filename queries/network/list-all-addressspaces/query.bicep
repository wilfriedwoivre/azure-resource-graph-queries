var name = 'list-all-addressspaces'
var query = '''
resources
| where type == "microsoft.network/virtualnetworks"
| project id, vnetName = name, spaces = (properties.addressSpace.addressPrefixes)
| mvexpand spaces

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

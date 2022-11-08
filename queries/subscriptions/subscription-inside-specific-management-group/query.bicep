var name = 'subscription-inside-specific-management-group'
var query = '''
resourcecontainers
 | where type == "microsoft.resources/subscriptions"
 | where (properties.managementGroupAncestorsChain) contains "Sandbox"

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

var name = 'subscriptions-countby-managementgroups'
var query = '''
resourcecontainers
| where type == 'microsoft.resources/subscriptions'
| project subscriptionName = name, managementgroups = (properties.managementGroupAncestorsChain)
| mv-expand managementgroups
| summarize count() by tostring(managementgroups.displayName)
| order by count_ desc 
'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

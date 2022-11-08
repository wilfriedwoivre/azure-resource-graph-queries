var name = 'subscription-resourcetype-count'
var query = '''
resources
| join kind=leftouter 
    (resourcecontainers
    | where type == 'microsoft.resources/subscriptions'
    | project subscriptionName=name, subscriptionId) on subscriptionId
| where subscriptionName  != ""
| summarize count() by type, subscriptionName

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

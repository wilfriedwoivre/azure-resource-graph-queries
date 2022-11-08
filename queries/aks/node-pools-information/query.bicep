var name = 'node-pools-information'
var query = '''
resources
| where type == "microsoft.containerservice/managedclusters"
| extend properties.agentPoolProfiles
| project subscriptionId, name, nodePool = properties.agentPoolProfiles
| mv-expand nodePool
| project subscriptionId, name, sku = nodePool.vmSize, count = nodePool.['count'], powerState = nodePool.powerState.code 

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

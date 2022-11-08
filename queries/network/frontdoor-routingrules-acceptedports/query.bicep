var name = 'frontdoor-routingrules-acceptedports'
var query = '''
resources
| where type == "microsoft.network/frontdoors"
| project subscriptionId, frontDoorName=name, routingRules = (properties.routingRules)
| mv-expand routingRules
| project subscriptionId, frontDoorName, routingRuleName=routingRules.name, protocols = routingRules.properties.acceptedProtocols

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

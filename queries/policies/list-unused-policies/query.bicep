param name string = 'list-unused-policies'

var query = '''
policyresources
| where type == "microsoft.authorization/policydefinitions" and tostring(properties.policyType) == "Custom"
| join kind=leftouter (
    policyresources
    | where type == "microsoft.authorization/policysetdefinitions" and tostring(properties.policyType) == "Custom"
    | mv-expand policyDefinitions
    | extend policyDefinitionId = tostring(policyDefinitions.policyDefinitionId)
    | distinct policyDefinitionId
) on $left.id == $right.policyDefinitionId
| where isnull($right.policyDefinitionId)
| join kind=leftouter(
    policyresources
    | where type == "microsoft.authorization/policyassignments"
    | extend policyDefinitionId = tostring(properties.policyDefinitionId)
    | distinct policyDefinitionId
) on $left.id == $right.policyDefinitionId
| where isnull($right.policyDefinitionId)
| project id, displayName = tostring(properties.displayName)
'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

var name = 'list-definitioncount-byscope'
var query = '''
policyresources
| where type == "microsoft.authorization/policydefinitions"
| extend policyType = tostring(properties.policyType)
| where policyType == "Custom"
| project id
| extend scope = tostring(split(id, "/providers/Microsoft.Authorization/policyDefinitions/", 0)[0])
| summarize count() by scope
| order by count_ desc 
'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

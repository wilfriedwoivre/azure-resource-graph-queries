var name = 'list-assignmentcount-byscope'
var query = '''
policyresources
| where type == "microsoft.authorization/policyassignments"
| extend scope = tostring(properties.scope)
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

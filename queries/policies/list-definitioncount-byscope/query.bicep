var name = 'list-definitioncount-byscope'
var query = '''
policyresources
| where type has "microsoft.authorization/policydefinitions"
| extend scope = tostring(parse_json(properties).scope)
| count() by scope| order by count_ desc


'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

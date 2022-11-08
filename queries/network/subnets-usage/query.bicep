var name = 'subnets-usage'
var query = '''
resources
| where type == "microsoft.network/virtualnetworks"
| project vnetName = name, subnets = (properties.subnets)
| mvexpand subnets
| extend subnetName = (subnets.name)
| extend mask = split(subnets.properties.addressPrefix, '/', 1)[0]
| extend usedIp = array_length(subnets.properties.ipConfigurations)
| extend totalIp = case(mask == 29, 3,
						mask == 28, 11,
						mask == 27, 27,
						mask == 26, 59,
						mask == 25, 123,
						mask == 24, 251,
						mask == 23, 507,
						mask == 22, 1019,
						mask == 21, 2043,
						mask == 20, 4091,
						mask == 19, 8187,
						mask == 18, 16379,
						mask == 17, 32763,
						mask == 16, 65531,
						mask == 15, 131067,
						mask == 14, 262139,
						mask == 13, 524283,
						mask == 12, 1048571,
						mask == 11, 2097147,
						mask == 10, 4194299,
						mask == 9, 8388603,
						mask == 8, 16777211,
						-1)
| extend availableIp = totalIp - usedIp
| project vnetName, subnetName, mask, usedIp, totalIp, availableIp, subnets
| order by toint(mask) desc

'''

resource rgQuery 'Microsoft.ResourceGraph/queries@2018-09-01-preview' = {
  name: name
  location: 'global'
  properties: {
    query: query
  }
}

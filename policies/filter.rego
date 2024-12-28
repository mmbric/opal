package authz_filter

default filtered = []
filtered = [item | 
  item = input.data[_];
  print("typeeee ",input.resource.type)
  print("iddddddd ",item.id)
  k := sprintf("auth_%s_%s", [input.resource.type, item.id])
  print("kkkk ",k)
  role := data.static.policy_data[input.user.companyId][k].role
  print("roleeeeeeee ",role)
  data.role_permissions[role][_] == input.action
  print("allowwwwww, data.role_permissions[role][_] == input.action)
]
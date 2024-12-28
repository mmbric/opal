package authz_filter

default filtered = []
filtered = [item | 
  item = input.data[_]; 
  k := sprintf("auth_%s_%s", [input.resource.type, item.id])
  role := data.static.policy_data[input.user.companyId][k].role
  data.role_permissions[role][_] == input.action
]
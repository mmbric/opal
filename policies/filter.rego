package authz_filter

import data.authz

default filtered = []
filtered = [item | 
  item = input.data[_];
  print("before-----")
  authz.is_allowed(input.user.companyId, input.resource.type, item.id, input)
  print("after-----")
]
package authz_filter

import data.authz

default filtered = []
filtered = [item | 
  item = input.data[_];
  authz.is_allowed(input.user.companyId, input.resource.type, item.id)
]
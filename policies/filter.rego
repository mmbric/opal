package authz_filter

default filtered = []
filtered := [obj | key, obj := data.static.policy_data[input.user.companyId][_]; obj.userId != null]
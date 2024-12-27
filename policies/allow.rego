package authz

# Default rule: Deny all requests
default allow = false

# Allow access if the user's role is "admin"
allow {
    input.user.role == "admin"
}

allow {
    input.resource.id == null
}

allow {
    k := sprintf("auth_%s_%s", [input.resource.type, input.resource.id])
    print("keyyyy ", k)
    role := data.static.policy_data[input.user.companyId][k]
    data.role_permissions[role][_] == input.action
}
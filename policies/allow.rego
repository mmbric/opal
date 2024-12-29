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
    is_allowed(input.user.companyId, input.resource.type, input.resource.id)
}

is_allowed(companyId, resourceType, resourceId) {
    k := sprintf("auth_%s_%s", [resourceType, resourceId])
    print("key----------",k)
    role := data.static.policy_data[companyId][k].role
    data.static.policy_data[companyId][k].userId == input.user.id
    print("role---------",role)
    print("action---------",input.action)
    data.role_permissions[role][_] == input.action
    print("is_allowed----------- TRUEEEEEE")
}
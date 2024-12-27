package authz

# Default rule: Deny all requests
default allow = false

# Allow access if the user's role is "admin"
allow {
    input.user.role == "admin"
}

allow {
    key = "auth_" + input.resource.resourceType + "_" +  input.entityId;
    role = data.static.policy_data[input.user.companyId][key]
    data.role_permissions[role][_] == input.action
}
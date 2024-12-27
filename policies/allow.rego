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
    key = "auth_" + input.resource.type + "_" +  input.resource.id
    print("authkey: ", key)
    role = data.static.policy_data[input.user.companyId][key]
    print("roleVal: ", role)
    data.role_permissions[role][_] == input.action
}
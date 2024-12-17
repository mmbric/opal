package authz

# Default rule: Deny all requests
default allow = false
default mydata=data

# Allow access if the user's role is "admin"
allow {
    input.user.role == "admin"
}

allow {
    input.user.role == "editor"
    input.resource.type == "agent"
    input.action == "edit"
}

allow {
    input.user.role == "reviewer"
    input.resource.type == "agent"
    ["POST", "GET"][_] == input.action
}
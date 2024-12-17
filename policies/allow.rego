package authz

# Default rule: Deny all requests
default allow = false

# Allow access if the user's role is "admin"
allow {
    input.user.role == "admin"
}

allow {
    input.user.role == "editor"
    input.resource.type == "agents"
    input.action == "edit"
}

allow {
    input.user.role == "reviewer"
    input.resource.type == "agents"
    ["POST", "GET"][_] == input.action
}
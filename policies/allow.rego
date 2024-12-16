package authz

# Default rule: Deny all requests
default allow = false

# Allow access if the user's role is "admin"
allow {
    input.user.role == "admin"
}

# Allow "editor" users to edit "document" resources
allow {
    input.user.role == {"editor"}
    input.resource.type == "document"
    input.action == "edit"
}

allow {
    input.user.role == {"editor", "viewer1"}
    input.resource.type == "document"
    input.action == "view"
}
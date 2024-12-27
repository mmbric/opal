package authz

# Default rule: Deny all requests
default allow = false

# Allow access if the user's role is "admin"
allow {
    print("input: ", input)
    input.user.role == "admin"
}



allow {
    input.resource.id == "id"
}
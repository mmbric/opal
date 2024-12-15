package example.allow

default allow = false

allow {
    input.user.role == "admin"
}

allow {
    input.user.role == "editor"
    input.resource.starts_with("/editor")
}

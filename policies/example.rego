package authz

default allow = false

allow if {
    input.method == "GET"
    input.path = ["users", user_id]
    input.user.id == user_id
}

allow if {
    input.user.roles[_] == "admin"
}

allow if {
    input.method == "GET"
    input.path = ["users"]
    input.user.id
}

allow if {
    input.method == "POST"
    input.path = ["users"]
    input.user.permissions[_] == "create_users"
}
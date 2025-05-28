package core_test

import data.core

test_allow_when_env_is_allowed if {
    result := core.allowed with input as {
        "username": "alice",
        "env": "prod"
    } with data.clients as [
        {
            "username": "alice",
            "allowedEnvironments": ["prod", "dev"]
        }
    ]
    result == true
}

test_deny_when_env_not_allowed if {
    result := core.allowed with input as {
        "username": "alice",
        "env": "staging"
    } with data.clients as [
        {
            "username": "alice",
            "allowedEnvironments": ["prod", "dev"]
        }
    ]
    result == false
}

test_deny_when_user_not_found if {
    result := core.allowed with input as {
        "username": "bob",
        "env": "prod"
    } with data.clients as [
        {
            "username": "alice",
            "allowedEnvironments": ["prod", "dev"]
        }
    ]
    result == false
}
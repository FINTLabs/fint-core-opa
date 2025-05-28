package core_test

import data.core

# ✅ Positive test: all values are allowed
test_allow_when_all_values_allowed if {
    result := core.allowed with input as {
        "username": "alice",
        "env": "prod",
        "component": "vurdering",
        "resource": "elev"
    } with data.clients as [
        {
            "username": "alice",
            "allowedEnvironments": ["prod", "dev"],
            "allowedComponents": ["vurdering", "kodeverk"],
            "allowedResources": ["elev", "fraværsregistrering"]
        }
    ]
    result == true
}

# ❌ Negative test: env not allowed
test_deny_when_env_not_allowed if {
    result := core.allowed with input as {
        "username": "alice",
        "env": "staging",
        "component": "vurdering",
        "resource": "elev"
    } with data.clients as [
        {
            "username": "alice",
            "allowedEnvironments": ["prod", "dev"],
            "allowedComponents": ["vurdering", "kodeverk"],
            "allowedResources": ["elev", "fraværsregistrering"]
        }
    ]
    result == false
}

# ❌ Negative test: component not allowed
test_deny_when_component_not_allowed if {
    result := core.allowed with input as {
        "username": "alice",
        "env": "prod",
        "component": "undervisning",
        "resource": "elev"
    } with data.clients as [
        {
            "username": "alice",
            "allowedEnvironments": ["prod", "dev"],
            "allowedComponents": ["vurdering", "kodeverk"],
            "allowedResources": ["elev", "fraværsregistrering"]
        }
    ]
    result == false
}

# ❌ Negative test: resource not allowed
test_deny_when_resource_not_allowed if{
    result := core.allowed with input as {
        "username": "alice",
        "env": "prod",
        "component": "kodeverk",
        "resource": "eksamen"
    } with data.clients as [
        {
            "username": "alice",
            "allowedEnvironments": ["prod", "dev"],
            "allowedComponents": ["vurdering", "kodeverk"],
            "allowedResources": ["elev", "fraværsregistrering"]
        }
    ]
    result == false
}
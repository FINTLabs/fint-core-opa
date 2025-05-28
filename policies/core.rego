package core

default allowed := false

allowed if {
	some user in data.clients
	user.username == input.username
	input.env in user.allowedEnvironments
	input.component in user.allowedComponents
	input.resource in user.allowedResources
}

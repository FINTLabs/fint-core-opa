package fintlabs

default allowed := false

allowed if {
	some user in data.clients
	user.username == input.username
	input.env in user.allowedEnvironments
}

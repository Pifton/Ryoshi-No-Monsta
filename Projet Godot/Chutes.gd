extends Area2D

func _on_Chutes_body_entered(body):
	if body.name == "Player":
		body.die()

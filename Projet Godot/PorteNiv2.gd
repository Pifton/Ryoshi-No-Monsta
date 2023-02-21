extends Area2D

func _on_PorteNiv2_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene('res://PageCredits.tscn')

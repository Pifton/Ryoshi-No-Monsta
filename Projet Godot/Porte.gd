extends Area2D

func _on_Porte_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene('res://Niveau 2.tscn')

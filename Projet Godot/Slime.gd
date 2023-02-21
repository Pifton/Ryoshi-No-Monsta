extends Area2D

var motion = Vector2()

func _ready():
	$AnimatedSprite.play("Slime")

func _on_Slime_body_entered(body):
	if body.name == "Player":
		body.die()

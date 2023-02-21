extends KinematicBody2D

signal player_died

const UP = Vector2(0, -1)
const GRAVITY = 30
const MAXFALLSPEED = 300
const MAXSPEED = 200
const JUMPFORCE = 560
const ACCELERATION = 25

var motion = Vector2()
var facing_right = true
var est_mort = false

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	if facing_right == true:
		$AnimatedSprite.scale.x = 1
	else:		$AnimatedSprite.scale.x = -1
	
	motion.x = clamp (motion.x,-MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("ui_right") and !est_mort:
		motion.x += ACCELERATION
		facing_right = true
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_left") and !est_mort:
		motion.x += -ACCELERATION
		facing_right = false
		$AnimatedSprite.play("Run")
	else:
		motion.x = lerp(motion.x,0,0.2)
		$AnimatedSprite.play("Statique")
		
	if is_on_floor() and est_mort:
		$AnimatedSprite.play("mort")
	if !is_on_floor() and est_mort:
		$AnimatedSprite.play("mort")
	
	if is_on_floor() and !est_mort:
		if Input.is_action_pressed("ui_up"):
			motion.y = -JUMPFORCE
	if !is_on_floor() and !est_mort:
		if motion.y < 0:
			$AnimatedSprite.play("Jump")
		if motion.y > 0:
			$AnimatedSprite.play("Fall")
		
	motion = move_and_slide(motion, UP)

func die ():
	est_mort = true
	$AnimatedSprite.play("mort")
	$AudioStreamPlayer2D.play()
	yield($AudioStreamPlayer2D,"finished")
	get_tree().reload_current_scene()



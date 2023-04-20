extends KinematicBody2D


var vel = 100
var moviment = Vector2.ZERO

func player():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("esquerra"):
		moviment.x = -vel
	if Input.is_action_pressed("dreta"):
		moviment.x = vel
	if Input.is_action_pressed("dalt"):
		moviment.y = -vel
	if Input.is_action_pressed("baix"):
		moviment.y = vel
	else:
		moviment.x = lerp(moviment.x,0,0.5)
		moviment.y = lerp(moviment.y,0,0.5)

	moviment = move_and_slide(moviment)
	




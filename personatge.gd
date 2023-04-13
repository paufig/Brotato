extends KinematicBody2D


var desplacament = Vector2(0,0)
var moviment = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("esquerra"):
		desplacament += Vector2(-200,0)
	if Input.is_action_pressed("dreta"):
		desplacament += Vector2(200,0)
	if Input.is_action_pressed("dalt"):
		desplacament += Vector2(0,-200)
	if Input.is_action_pressed("baix"):
		desplacament += Vector2(0,200)
	if Input.is_action_just_released("dreta") or Input.is_action_just_released("esquerra"):
		moviment.x = 0
		desplacament.x = 0
	if Input.is_action_just_released("dalt") or Input.is_action_just_released("baix"):
		moviment.y = 0
		desplacament.y = 0
	moviment += desplacament.normalized()
	moviment = move_and_slide(moviment)
	




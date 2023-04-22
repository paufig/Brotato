extends KinematicBody2D

onready var knackles = get_tree().get_root().get_node("Node2D/knackles")
var move = Vector2()
var vel = 40
var vida = 75
func _physics_process(delta):
	move = position.direction_to(knackles.global_position) 
	var dir = knackles.position - position
	move = move_and_slide(move * vel)
	
	if vida == 0:
		visible = false



func _on_Area2D_body_entered(body):
	vida = vida - 25
	print("a")

func _on_Area2D_body_exited(body):
	print("b")

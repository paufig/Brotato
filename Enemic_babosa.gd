extends KinematicBody2D

onready var knackles = get_tree().get_root().get_node("Node2D/knackles")
var move = Vector2()
var vel = 40

func _physics_process(delta):
	move = position.direction_to(knackles.global_position) 
	var dir = knackles.position - position
	get_node("AnimatedSprite").rotation = dir.angle()
	move = move_and_slide(move * vel)



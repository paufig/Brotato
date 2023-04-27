extends KinematicBody2D
export var damage = 10
onready var knackles = get_tree().get_root().get_node("Node2D/knackles")
var move = Vector2()
var vel = 40
var vida = 75

func _physics_process(delta):
	move = position.direction_to(knackles.global_position) 
	var dir = knackles.position - position
	move = move_and_slide(move * vel)
	
	


func _on_Area2D_area_entered(area):
	if area.name == "Area2D":
		vida = vida - 25
		area.get_parent().get_parent().queue_free()
	if vida <= 0:
			queue_free()

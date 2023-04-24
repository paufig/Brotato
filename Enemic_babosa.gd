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
	
	if vida == 0:
		position = Vector2(1000,1000)


func _on_Area2D_area_entered(area):
	if area.name == "Area2D":
		vida = vida - 25
	print(area)  

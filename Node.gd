extends Node
onready var target = get_node("/root/Enemic/KinematicBody2D")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	var target_position = target.global_position
	var golbal_position=target_position

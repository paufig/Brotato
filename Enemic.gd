extends KinematicBody2D

var speed = 100
var target = null
var ray = null

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func physics_process(delta):
	look_at(target.global_position)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

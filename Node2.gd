extends Node

var target_scene = load("res://personatge.tscn")
var target_node = target_scene.instance()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	add_child(target_node)

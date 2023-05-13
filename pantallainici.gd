extends Node2D

export (PackedScene) var scn_game
var op_act = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#

func _on_jugar_pressed():
	get_tree().change_scene_to(scn_game)
	print("a")

func _on_escriptori_pressed():
	get_tree().quit()

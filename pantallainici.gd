extends Node2D

export (PackedScene) var scn_game
var op_act = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("tecla_selec_jugar")):
		op_act = !op_act
		if (op_act):
			$GUI/cursor.rect_position = $GUI/pos1.position
		else:
			$GUI/cursor.rect_position = $GUI/pos2.position
	if (Input.is_action_just_pressed("enter")) and ($GUI/cursor.rect_position == $GUI/pos1.position):
		get_tree().change_scene_to(scn_game)
	if (Input.is_action_just_pressed("enter")) and ($GUI/cursor.rect_position == $GUI/pos2.position):
		get_tree().quit()

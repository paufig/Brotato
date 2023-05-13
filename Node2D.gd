extends Node2D

export (PackedScene) var scn_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	$monedes/monedes.text = str(Global.gemas)
	$CanvasLayer/vidaactual.text = "Vida: " + str(Global.max_vida)
	$CanvasLayer2/damageactual.text = "Damage: " + str(Global.damage)
	$CanvasLayer3/cadenciaactual.text = "Cadència: " + str(Global.velocitat_arma)
	$CanvasLayer4/velocitatactual.text = "Velocitat: " + str(Global.vel)
	$CanvasLayer6/monedes.text = str(Global.gemas)

func _on_TextureButton_pressed():
	if Global.gemas >= 2:
		Global.max_vida += 10
		Global.gemas -=2
	#$CanvasLayer/ColorRect.color = Color(2,43,0,5)
	
func _on_damage_pressed():
	if Global.gemas >= 2:
		Global.damage += 2
		Global.gemas -=2

func _on_cadencia_pressed():
	if Global.gemas >= 2:
		Global.velocitat_arma += 0.2
		Global.gemas -=2 


func _on_velocitat_pressed():
	if Global.gemas >= 2:
		Global.vel += 10
		Global.gemas -=2 


func _on_jugar_pressed():
	get_tree().change_scene_to(scn_game)

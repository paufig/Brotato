extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	$stats_actuals/Label.text = "Vida: " + str(Global.max_vida)+ ", Damage: " + str(Global.damage) + ", Cadència: " + str(Global.velocitat_arma)


func _on_TextureButton_pressed():
	Global.max_vida += 10
	#$CanvasLayer/ColorRect.color = Color(2,43,0,5)
	
func _on_damage_pressed():
	
	Global.damage += 2

func _on_cadencia_pressed():
	Global.velocitat_arma += 0.2 # Replace with function body.


func _on_velocitat_pressed():
	Global.velocitat += 10 # Replace with function body.

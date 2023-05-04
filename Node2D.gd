extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_TouchScreenButton_pressed():
	pass

func _on_TouchScreenButton2_pressed():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_TextureButton_pressed():
	Global.max_vida += 10
	$CanvasLayer/ColorRect.color = Color(2,43,0,5)
	

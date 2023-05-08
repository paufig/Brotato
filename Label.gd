extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Label.text = str(Global.gemas)


func _process(delta):
	$CanvasLayer/Label.text = str(Global.gemas)

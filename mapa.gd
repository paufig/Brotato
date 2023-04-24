extends Node2D


func _ready():
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://Enemic.tscn")
	
	var screen_size = get_viewport().get_visible_rect().size
	
	for i in range(0,10):
		var enemy = enemyscene.instance()
		rand.randomize()
	

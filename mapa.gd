extends Node2D


var enemics_spawn
var rand = RandomNumberGenerator.new()
var enemyscene = load("res://Enemic_babosa.tscn")
var timer
var screen_size 
var cooldown = 5
var spawn = true
var vegades = 0
var timer_nivell

func _ready(): 
	timer = Timer.new()
	add_child(timer)
	timer.set_one_shot(true)
	timer.set_wait_time(cooldown)
	timer.connect("timeout",self, "_cooldown_finish")
	
	var screen_size = get_viewport().get_visible_rect().size
	
func _process(delta):
	
	if spawn == true:
		timer.start()
		vegades = vegades + 2 
		enemics_spawn = vegades
		for i in range(0,enemics_spawn):
			var enemy = enemyscene.instance()
			rand.randomize()
			var x = rand.randf_range(0,1025)
			rand.randomize()
			var y = rand.randf_range(0,590)
			enemy.position.y = y
			enemy.position.x = x
			$Enemics.add_child(enemy)
		spawn = false
		
func _cooldown_finish():
		spawn = true
		
func _cooldown_finish_nivell():
	print("canvi!")
	get_tree().change_scene("res://pantallainici.tscn")

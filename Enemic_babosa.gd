extends KinematicBody2D
export var damage = 10
onready var knackles = get_tree().get_root().get_node("Node2D/knackles")
var move = Vector2()
var vel = 50
var vida = 50
var stop = 0
var estar_mort = false

func _ready():
	if Global.nivell == 1:
		vel = 50
		vida = 50
		damage = 10
	if Global.nivell == 2:
		vel = 60
		vida = 55
		damage = 20
	if Global.nivell == 3:
		vel = 70
		vida = 60
		damage = 30
	if Global.nivell == 4:
		vel = 80
		vida = 65
		damage = 40
	if Global.nivell == 5:
		vel = 90
		vida = 70
		damage = 50
	if Global.nivell == 6:
		vel = 100
		vida = 75
		damage = 60
	if Global.nivell == 7:
		vel = 110
		vida = 80
		damage = 70
	if Global.nivell == 8:
		vel = 120
		vida = 85
		damage = 60
	if Global.nivell == 9:
		vel = 130
		vida = 90
		damage = 60
	if Global.nivell == 10:
		vel = 140
		vida = 100
		damage = 60
		
func _physics_process(delta):
	move = position.direction_to(knackles.global_position) 
	var dir = knackles.position - position
	if stop != 1:
		if move.x <= 0:
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("moviment")
			
		elif move.x > 0:
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("moviment")
	if stop != 1:
		move = move_and_slide(move * vel)
	
	


func _on_Area2D_area_entered(area):
	if area.name == "Area2D":
		vida = vida - Global.damage
		area.get_parent().get_parent().queue_free()
	if vida <= 0 and estar_mort == false:
		mor()

func mor():
	estar_mort = true
	stop = 1
	$Timer.start()
	Global.gemas += 1
	if move.x <= 0:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("mort")
		if Global.soroll == true:
			$metalpipe.play()
	elif move.x > 0:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("mort")
		if Global.soroll == true:
			$metalpipe.play()


func _on_Timer_timeout():
	queue_free()

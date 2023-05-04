extends KinematicBody2D
export var damage = 10
onready var knackles = get_tree().get_root().get_node("Node2D/knackles")
var move = Vector2()
var vel = 40
var vida = 50
var stop = 0 

func _ready():
	if Global.nivell == 1:
		vel = 40
		vida = 50
		damage = 10
	if Global.nivell == 2:
		vel = 45
		vida = 60
		damage = 20
	if Global.nivell == 3:
		vel = 50
		vida = 70
		damage = 30
	if Global.nivell == 4:
		vel = 55
		vida = 80
		damage = 40
	if Global.nivell == 5:
		vel = 60
		vida = 90
		damage = 50
	if Global.nivell == 6:
		vel = 65
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
	if vida <= 0:
		stop = 1
		$Timer.start()
		Global.gemas += 1
		if move.x <= 0:
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("mort")
			
		elif move.x > 0:
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("mort")
		


func _on_Timer_timeout():
	queue_free()

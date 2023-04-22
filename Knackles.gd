extends KinematicBody2D

onready var enemic = get_node("/root/Node2D/Enemic_babosa")
onready var preBullet = preload("res://Bala.tscn")
onready var armas = get_node("Arma")
export var cooldown = 2
var vel = 100
var moviment = Vector2.ZERO
var timer 
var puede_disparar = true
var apuntar = Vector2()

func _ready(): 
	timer = Timer.new()
	add_child(timer)
	timer.set_one_shot(true)
	timer.set_wait_time(cooldown)
	timer.connect("timeout",self, "_cooldown_finish")

func _physics_process(delta):
	if Input.is_action_pressed("esquerra"):
		moviment.x = -vel
	if Input.is_action_pressed("dreta"):
		moviment.x = vel
	if Input.is_action_pressed("dalt"):
		moviment.y = -vel
	if Input.is_action_pressed("baix"):
		moviment.y = vel
	else:
		moviment.x = lerp(moviment.x,0,0.5)
		moviment.y = lerp(moviment.y,0,0.5)

	moviment = move_and_slide(moviment)
	
	armas.look_at(enemic.position)

	
	if puede_disparar == true:
		timer.start()
		shoot()
		
func shoot():
	var bullet = preBullet.instance()
	get_parent().add_child(bullet)
	bullet.position = armas.global_position
	bullet.rotate(armas.global_rotation)
	puede_disparar = false

func _cooldown_finish():
	puede_disparar = true



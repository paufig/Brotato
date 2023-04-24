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
var vida = 100

func _ready(): 
	timer = Timer.new()
	add_child(timer)
	timer.set_one_shot(true)
	timer.set_wait_time(cooldown)
	timer.connect("timeout",self, "_cooldown_finish")

func _physics_process(delta):
	var desplacament = Vector2.ZERO 
	if Input.is_action_pressed("dreta"):
		desplacament = Vector2.RIGHT
		
	if Input.is_action_pressed("esquerra"):
		desplacament += Vector2.LEFT 
		
	if Input.is_action_pressed("baix"):
		desplacament += Vector2.DOWN
		
	if Input.is_action_pressed("dalt"):
		desplacament += Vector2.UP
	
	moviment = desplacament.normalized() * vel
	move_and_slide(moviment)
	
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


func damage_player (damage):
	vida -= damage 
	

func _on_Hurbox_area_entered(area):
	if area.get_parent().is_in_group("enemy"):
		damage_player(area.get_parent().damage)

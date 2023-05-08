extends KinematicBody2D
var enemic_proper 
onready var preBullet = preload("res://Bala.tscn")
onready var armas = get_node("Arma")
var cooldown = Global.velocitat_arma
var vel = Global.vel
var moviment = Vector2.ZERO
var timer 
var puede_disparar = true
var apuntar = Vector2()
var vida = 100 setget canvi_vida

onready var barra_vida = $barra_vida/TextureProgress
onready var tween = $barra_vida/Tween


func canvi_vida(nova_vida):
	tween.interpolate_property(barra_vida, "value", vida, nova_vida, 0.2)
	vida = nova_vida
	tween.start()
	if vida <= 0:
		mor()
	
	barra_vida.value = vida

func mor():
	pass

func nou_nivell():
	barra_vida.max_value = Global.max_vida
	self.vida = Global.max_vida

func _ready():
	nou_nivell()
	timer = Timer.new()
	add_child(timer)
	timer.set_one_shot(true)
	timer.set_wait_time(cooldown)
	timer.connect("timeout",self, "_cooldown_finish")

func _physics_process(delta):
	$CanvasLayer/Label.text = str(Global.gemas)
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
	var distancia_enemic
	if Global.stop == false:
		if enemic_proper == null or not is_instance_valid(enemic_proper):
			distancia_enemic = 10000000000
		else:
			distancia_enemic = global_position.distance_squared_to(enemic_proper.global_position)
		
		for enemic in Global.Enemics.get_children():
			var d = global_position.distance_squared_to(enemic.global_position)
			if d < distancia_enemic:
				distancia_enemic = d
				enemic_proper = enemic
		
		if enemic_proper != null:
			armas.look_at(enemic_proper.position)

		
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
	self.vida -= damage 

	

func _on_Hurbox_area_entered(area):
	if area.get_parent().is_in_group("enemy"):
		damage_player(area.get_parent().damage)

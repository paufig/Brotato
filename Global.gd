extends Node

var Enemics : Node2D
var max_vida = 100
var damage = 25
var velocitat_arma = 0.7
var damage_enemics = 10
var vida_enemics = 50
var nivell = 1
var gemas = 100
var vel = 100
var stop = false
var soroll = true

func reinicia():
	max_vida = 100
	damage = 25
	velocitat_arma = 2
	damage_enemics = 10
	vida_enemics = 50
	nivell = 1
	gemas = 0
	vel = 100
	stop = false
	soroll = true

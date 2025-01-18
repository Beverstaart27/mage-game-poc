extends Node2D

const SPELLSPRITE = preload("res://scenes/basic__spell_1.tscn")
@onready var spawnLocation: Marker2D = $SpellSpawnLocation

var onCooldown:bool = false
var coolDownTime = 0.5

#I pretend this is the block where you set stuff on startup like unity :D


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("fire_spell") && !onCooldown:
		fireSpell() 
	

func fireSpell() -> void:
	startTimer()
	var spell_instance = SPELLSPRITE.instantiate()
	get_tree().root.add_child(spell_instance)
	spell_instance.global_position = spawnLocation.global_position
	spell_instance.rotation = rotation

func startTimer() -> void:
	onCooldown = true
	$spell1Cooldown.start(coolDownTime) 

func _on_spell_1_cooldown_timeout() -> void:
	onCooldown = false

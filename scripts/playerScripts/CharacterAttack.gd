extends Node2D

const SPELLSPRITE1 = preload("res://scenes/spellScenes/basic_spell_1.tscn")
const SPELLSPRITE2 = preload("res://scenes/spellScenes/BigSpell.tscn")
@onready var spawnLocation: Marker2D = $SpellSpawnLocation

var onCooldown1:bool = false
var onCooldown2:bool = false
var onCooldown3:bool = false

var cooldownTime1 = 0.5
var cooldownTime2 = 1


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("fire_spell_LMB") && !onCooldown1:
		shootSpell(1, cooldownTime1)
		#print("i say what what")
		
	if Input.is_action_just_pressed("fire_spell_Q") && !onCooldown2:
		shootSpell(2, cooldownTime2)
		#print("in the butt")
	

func shootSpell(spell: int, cooldown: float) -> void:
	var spell_instance
	
	match spell:
		1:
			onCooldown1 = true
			print(cooldown)
			$spell1Cooldown.start(cooldown) 
			spell_instance = SPELLSPRITE1.instantiate()

		2: 
			onCooldown2 = true
			$spell2Cooldown.start(cooldown) 
			spell_instance = SPELLSPRITE2.instantiate()
		
	get_tree().root.add_child(spell_instance)
	spell_instance.global_position = spawnLocation.global_position
	spell_instance.rotation = rotation

func _on_spell_1_cooldown_timeout() -> void:
	#print("1")
	onCooldown1 = false 
	
func _on_spell_2_cooldown_timeout() -> void:
	#print("2")
	onCooldown2 = false
